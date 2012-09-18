class SearchController < ApplicationController

  def new
    respond_to do |format|
      format.html # new.html.erb
      end
  end

  def search
    puts params[:q]
    @post_search = Post.all(:conditions => ["content like ? ", "%" + params[:q] + "%"])
    respond_to do |format|
        format.html # search.html.erb
        format.json { render json: @post_search }
    end
  end
end