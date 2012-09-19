class OthersController < ApplicationController

  def index
  user_list =  params[:user_list]
  @other_users = User.all(:conditions => ["id in (#{user_list[:user_id].join(',')})"])

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @other_users }
  end

  end
end
