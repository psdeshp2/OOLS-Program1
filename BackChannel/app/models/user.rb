class User < ActiveRecord::Base
  attr_accessible :admin_flag, :password, :username
end
