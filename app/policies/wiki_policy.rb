class WikiPolicy < ApplicationPolicy
    def index?
        true
    end
    
    def show?
       user.admin? or user.premium? or not record.private?
    end

end