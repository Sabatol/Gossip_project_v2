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
    if session[:user_id] == nil
      redirect_to new_session_path
    else
      current_user = User.find_by(id: session[:user_id])
      @comment = Comment.new(content: params[:content], gossip_id: params[:gossip_id], user: current_user)
      if @comment.save
        puts "#########################"
        puts "Comment créé avec succès !"
        puts "#########################"
        redirect_to gossip_path(@comment.gossip.id)
      else
        flash[:alert] = "Echec de la création !"
        redirect_to gossip_path(@comment.gossip.id)
      end
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if session[:user_id] != @comment.user_id
      redirect_to new_session_path
    else
      if @comment.update(content: params[:content])
        redirect_to gossip_path(params[:gossip_id])
      else
        render :edit
      end
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    if session[:user_id] != @comment.user_id
      redirect_to new_session_path
    else
      @comment.destroy
      redirect_to gossip_path(params[:gossip_id])
    end
  end
end
