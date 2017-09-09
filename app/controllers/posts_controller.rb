require 'pry'

class PostsController < ApplicationController

  def new
    @post = Post.new
    render partial: 'form'
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path
    else
      render partial: 'form'
    end
  end


  def index
  end

  def show
  end

  def like
    post = Post.find(params[:id])
    post.likes = post.likes + 1
    post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption, :likes)
  end
end
