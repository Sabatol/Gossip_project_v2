class SessionController < ApplicationController
  def new
    #@session = Session.new(email: params[:email], password: params[:password])
  end
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      #####
      if params[:remember_me]
        remember(@user)
        redirect_to welcome_path(@user.id)
      else
        remember_temp(@user)
        redirect_to root_path
      end
    else
      flash.now[:danger] = 'Tutututu ça ne match pas !'
      render 'new'
    end
  end
  def destroy
    log_out(current_user)
    redirect_to root_path
  end
end
