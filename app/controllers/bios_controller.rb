class BiosController < ApplicationController
  def new
    @bio = Bio.new
    render partial: 'form'
  end

  def create
    @bio = Bio.new(bio_params)
    @bio.profile_image = 'Default Image'
    @bio.user_id = current_user.id
    if @bio.save
      redirect_to user_path
    else
      render partial: 'form'
    end
  end

  def edit
    @bio = current_user.bio
    render partial: 'form'
  end

  def update
    @bio = current_user.bio
    if @bio.update(bio_params)
      redirect_to user_path
    else
      render partial: 'form'
    end
  end

  def show
  end

  private

  def bio_params
    params.require(:bio).permit(:profile_image, :description)
  end
end
