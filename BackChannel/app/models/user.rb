class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :admin_flag, :password, :crypted_password, :password_salt, :persistence_token,:password_confirmation,:username, :email

  has_many :posts
  has_many :comments

  validates :username, :presence => true
  validates :password, :presence => true , :on => :create
end
