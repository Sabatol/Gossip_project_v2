class ApplicationController < ActionController::Base
  def current_user
    id = session[:user_id]
    @current_user = User.find(id)
  end
end
