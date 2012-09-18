module UserSessionsHelper
  def admin_user?
    if current_user
      if @current_user.admin_flag == 1
        return true
      else
        return false
      end
    end
  end
end
