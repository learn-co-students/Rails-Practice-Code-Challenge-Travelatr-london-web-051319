class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(bloggerparams)
    if @blogger.save
      redirect_to bloggers_path
    else
      render :new
    end
  end


  private

  def bloggerparams
    params.require(:blogger).permit(:name,:age,:bio)
  end

end
