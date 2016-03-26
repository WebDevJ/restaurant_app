class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence:true, uniqueness: true
  validates :empl_type, inclusion: {in: ["Manager", "Chef", "Server"]}
#  has_secure_password
end
