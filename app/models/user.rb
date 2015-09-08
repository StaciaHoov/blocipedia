class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :collaborators
  has_many :wikis, through: :collaborators

  def standard?
    role == 'standard'
  end
  
  def premium?
    role == 'premium'
  end
  
  def admin?
    role == 'admin'
  end
  
  def publicize_wikis
    wikis.each do |wiki|
      if wiki.private == true
        wiki.update_attributes(private: false)
      end
    end
  end

end