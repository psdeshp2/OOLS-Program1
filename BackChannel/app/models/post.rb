class Post < ActiveRecord::Base
  attr_accessible :content
  attr_accessible :category_id
  attr_accessible :user_id

  belongs_to(:category)
  belongs_to(:user)

  has_many :comments
  has_many :votes

  validates :content, :presence => true
  validates :category, :presence => true
  validates :user, :presence => true

end
