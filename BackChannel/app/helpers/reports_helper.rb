module ReportsHelper

  def number_of_posts_per_user(user_id)
    Post.count_by_sql "Select count(*) from posts where posts.user_id = '" +user_id.to_s+ "'"
  end

  def number_of_comments_per_user(user_id)
    Comment.count_by_sql "Select count(*) from comments where comments.user_id = '" +user_id.to_s+ "'"
  end

  def number_of_votes_per_user(user_id)
    Vote.count_by_sql "Select count(*) from votes where votes.user_id = '" +user_id.to_s+ "'"
  end
end
