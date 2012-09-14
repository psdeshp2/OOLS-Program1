class Comment < ActiveRecord::Base
  attr_accessible :content
  attr_accessible :user_id

  attr_accessible :post_id

  belongs_to :post
  belongs_to :user

  has_many :votes

  validates :content, :presence => true
  validates :post, :presence => true
  validates :user, :presence => true

  def check_if_it_comes_here
      puts "Yes!!! It is here"
  end


end
