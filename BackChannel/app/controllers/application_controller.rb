class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user,:require_user,:require_no_user,:admin_user?,:require_admin

  public

  def require_user
    unless current_user
    flash[:notice] = "You must be logged in to access this page"
    redirect_to root_url
    return false
    end
  end

  def require_no_user
    if current_user
    flash[:notice] = "You must be logged out to access this page"
    redirect_to posts_path
    return false
    end
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def admin_user?
    if current_user
      if @current_user.admin_flag == 1
        return true
      else
        return false
      end
    end
  end

  def require_admin
    unless admin_user?
      flash[:notice] = "You must be an admin to view this page"
      redirect_to root_url
      return false
    end
  end
end
