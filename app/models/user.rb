class User < ActiveRecord::Base
  validates :email, :username, uniqueness: true
  #todo add index to email and username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  has_and_belongs_to_many :channels
end