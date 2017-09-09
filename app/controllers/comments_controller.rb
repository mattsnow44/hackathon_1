require 'pry'

class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = Comment.new
    render partial: 'form'
  end

  def create
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
