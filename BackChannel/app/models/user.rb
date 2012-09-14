class User < ActiveRecord::Base
  attr_accessible :admin_flag, :password, :username

  has_many :posts
  has_many :comments
  has_many :votes

  validates :username, :presence => true
  validates :password, :presence => true
end
