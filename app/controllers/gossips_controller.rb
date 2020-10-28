class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @cities = City.all
  end
  def show
    id = params[:id]
    @gossip = Gossip.find(params[:id])
  end
  def new
    @gossip = Gossip.new
  end
  def create
    @gossip = Gossip.new(user: User.first, content: params[:content], title: params[:title])
    if @gossip.save
      puts "#########################"
      puts "Gossip créé avec succès !"
      puts "#########################"
      redirect_to root_path
    else
      render 'new' 
      flash[:alert] = "Echec de la quête !"
    end
  end
  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(post_params)
    if @gossip.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
end
