class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to "/posts", notice: 'You have successfully logged in.' }
        format.json { render json: @user_session, status: :created, location: @user_session }
      else
        format.html { render action: "new" }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
