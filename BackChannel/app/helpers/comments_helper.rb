module CommentsHelper

  def show_by_post_id(post_id)
    Comment.check_if_it_comes_here

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end
end
