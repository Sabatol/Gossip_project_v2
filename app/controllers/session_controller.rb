class SessionController < ApplicationController
  def new
    @user = User.find_by(email: params[:email], password_digest: params[:password_digest])
  end
  def create
    
  end
  def destroy
    
  end
end
