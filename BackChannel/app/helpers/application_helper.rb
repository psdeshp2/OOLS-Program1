module ApplicationHelper

  def show_comments_for_post(post_id)
    Comment.show_by_post_id(post_id)
  end

  def return_current_user
    return 1
  end

end
