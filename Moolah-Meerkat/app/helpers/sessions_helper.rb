module SessionsHelper

  def logged_in?
    session[:user_id].present?
  end

  def authenticated!
    unless logged_in?
      redirect_to new_session_path
    end
  end
#TODO if user.findby sessions id returns null delete the cookie and return new user show page
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end