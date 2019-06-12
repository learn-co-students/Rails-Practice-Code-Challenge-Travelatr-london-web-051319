class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(postparams)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to @post
  end


  private

  def postparams
    params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
  end


end
