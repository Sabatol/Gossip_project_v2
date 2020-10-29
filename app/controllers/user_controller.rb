class UserController < ApplicationController
  def show
    id = params[:id]
    @user = User.find(params[:id])
    @gossips = @user.gossips
  end  
  def new
    @user = User.new
  end
  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], city_id: params[:city_id], email: params[:email], age: params[:age], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      puts "###################################"
      puts "Tu as été créé avec succès, bravo !"
      puts "###################################"
      redirect_to welcome_path(@user.id)
    else
      flash[:alert] = "Echec de la création !"
      render 'new' 
    end
  end
end
