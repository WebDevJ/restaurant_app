class User < ActiveRecord::base
  validates :username, presence:
  true, uniqueness: true
  has_secure_password
end
  
