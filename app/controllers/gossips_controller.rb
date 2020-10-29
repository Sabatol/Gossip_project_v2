class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @cities = City.all
  end
  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
    @comment = Comment.new
  end
  def new
    @gossip = Gossip.new
  end
  def create
    if session[:user_id] == nil
      redirect_to new_session_path
    else
      current_user = User.find_by(id: session[:user_id])
      @gossip = Gossip.new(user: current_user, content: params[:content], title: params[:title])
      if @gossip.save
        puts "#########################"
        puts "Gossip créé avec succès !"
        puts "#########################"
        redirect_to root_path
      else
        render 'new' 
        flash[:alert] = "Echec de la création !"
      end
    end
  end
  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if session[:user_id] != @gossip.user_id
      redirect_to new_session_path
    else
      post_params = params.require(:gossip).permit(:title, :content)
      @gossip.update(post_params)
      if @gossip.update(post_params)
        redirect_to root_path
      else
        render :edit
      end
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    if session[:user_id] != @gossip.user_id
      redirect_to new_session_path
    else
      @gossip.destroy
      redirect_to root_path
    end
  end
end
