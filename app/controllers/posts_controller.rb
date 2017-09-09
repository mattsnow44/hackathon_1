
class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :destroy]

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
    @posts = Post.order('created_at')
  end

  def show
  end

  def edit
    render partial: 'form'
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render partial: 'form'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def like
    post = Post.find(params[:id])
    post.likes = post.likes + 1
    post.save
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption, :likes)
  end
end
