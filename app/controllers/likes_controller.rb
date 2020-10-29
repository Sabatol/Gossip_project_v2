class LikesController < ApplicationController
  before_action :authenticate_user

  def new
    @like = Like.new
  end

  def create
    current_user = User.find_by(id: session[:user_id])
    @like = Like.new(gossip_id: params[:gossip_id], user: current_user)
    if @like.save
      redirect_to gossip_path(params[:gossip_id])
    else
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to gossip_path(params[:gossip_id])
  end

  private 

  def authenticate_user
    current_user = User.find_by(id: session[:user_id])
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
