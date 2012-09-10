class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :post_id, :comment_id

  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates :user_id

end
