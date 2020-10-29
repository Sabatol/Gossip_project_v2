class SessionController < ApplicationController
  def new
    #@session = Session.new(email: params[:email], password: params[:password])
  end
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to welcome_path(@user.id)
    else
      flash.now[:danger] = 'Tutututu ça ne match pas !'
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
  end
end
