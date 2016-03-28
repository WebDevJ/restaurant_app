class User < ActiveRecord::Base
  has_many :menus, through: :orders
  has_many :parties, through: :orders


  validates :username, presence: true
  validates :email, presence:true, uniqueness: true
  validates :empl_type, inclusion: {in: ["Manager", "Chef", "Server"]}
has_secure_password
end
