class SearchController < ApplicationController

  def new
    respond_to do |format|
      format.html # new.html.erb
      end
  end

  def search
    puts params[:q]
    #@post_search = Post.all(:conditions => ["content like ? ", "%" + params[:q] + "%"])
    @post_search = Post.find_by_sql("
    select * from posts where content like '%#{params[:q]}%' OR category_id in (select id from categories where name like '%#{params[:q]}%') OR
    user_id in (select id from users where username like '%#{params[:q]}%')")
    respond_to do |format|
        format.html # search.html.erb
        format.json { render json: @post_search }
    end
  end
end