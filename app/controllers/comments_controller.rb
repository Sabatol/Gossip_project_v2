class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def show
    @comment = Comment.find(params[:comment_id])
  end
  def new
    id = params[:id]
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(content: params[:content], gossip_id: params[:gossip_id], user: User.first)
    if @comment.save
      puts "#########################"
      puts "Comment créé avec succès !"
      puts "#########################"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:alert] = "Echec de la création !"
      redirect_to gossip_path(params[:gossip_id])
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      redirect_to gossip_path(params[:gossip_id])
    else
      render :edit
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end
end
