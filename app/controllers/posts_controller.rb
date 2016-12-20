class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
