class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :wikis, dependent: :destroy

  def standard?
    role == 'standard'
  end
  
  def premium?
    role == 'premium'
  end
  
  def admin?
    role == 'admin'
  end

end