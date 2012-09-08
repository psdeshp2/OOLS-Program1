class User < ActiveRecord::Base
  attr_accessible :admin_flag, :password, :username

  has_many :posts

  validates :username, :presence => true
end
