class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @cities = City.all
  end
  def show
    id = params[:id]
    @comment= Comment.find(params[:id])
  end
  def new
    @comment= Comment.new
  end
  def create
    @comment= Comment.new(user: User.first, content: params[:content], title: params[:title])
    if @commentsave
      puts "#########################"
      puts "Comment créé avec succès !"
      puts "#########################"
      redirect_to root_path
    else
      render 'new' 
      flash[:alert] = "Echec de la quête !"
    end
  end
  def edit
    @comment= Comment.find(params[:id])
  end

  def update
    @comment= Comment.find(params[:id])
    post_params = params.require(:Comment).permit(:title, :content)
    @commentupdate(post_params)
    if @commentupdate(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
end
