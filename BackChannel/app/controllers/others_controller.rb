class OthersController < ApplicationController

  def comments
    @comment = Comment.find(params[:comment_id])
    @post = @comment.post
    @votes = @comment.votes
  end

  def posts
    @post = Post.find(params[:post])
    @votes = @post.votes
  end

end
