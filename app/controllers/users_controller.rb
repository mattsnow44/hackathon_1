require 'pry'
class UsersController < ApplicationController
  before_action :check_bio, only: [:show]
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def check_bio
    unless current_user.bio
      redirect_to new_user_bio_path(current_user)
    end
  end
end
