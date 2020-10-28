class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def show
    id = params[:id]
    @comment = Comment.find(params[:comment_id])
  end
  def new
    id = params[:id]
    @comment = Comment.new
  end
  def create
    id1 = params[:gossip_id]
    id2 = params[:user_id]
    @comment = Comment.new(content: params[:content], gossip_id: id1, user: User.first)
    puts "Test #{@comment.content}"
    puts "#{@comment.errors.messages}"
    if @comment.save
      puts "#########################"
      puts "Comment créé avec succès !"
      puts "#########################"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:alert] = "Echec de la quête !"
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
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to root_path
  end
end
