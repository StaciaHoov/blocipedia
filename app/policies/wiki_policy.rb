class WikiPolicy < ApplicationPolicy
    # def index?
    #   true
    # end
    
    # # def show?
    # #   user.admin? or user.premium? or not record.private?
    # # end
    
    class Scope
        attr_reader :user, :scope
        
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
        
        def resolve
            wikis = []
            
            if user && user.role == 'admin'
                wikis = scope.all #show them all
                
            elsif user && user.role == 'premium'
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if wiki.private == nil || wiki.private == false || wiki.user == user || wiki.users.include?(user)
                        wikis << wiki # only show public, private wikis they created or are a collaborator on
                    end
                end
            else
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if wiki.private == nil || wiki.private == false || wiki.users.include?(user) # show standard users public wikis and privates they are collaborator on
                        wikis << wiki 
                    end
                end
            end
            wikis # return the wikis array
        end
        
    end
end