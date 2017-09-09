require 'pry'

class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  def new
    @comment = Comment.new
    render partial: 'form'
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.likes = 0
    if @comment.save
      redirect_to root_path
    else
      render partial: 'form'
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @comment.update(comment_params)
      redirect_to root_path
    else
      render partial: 'form'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :likes, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
