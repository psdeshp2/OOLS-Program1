class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id
  attr_accessible :post_id

  belongs_to :user
  belongs_to :post

  validates :user, :presence => true
end
