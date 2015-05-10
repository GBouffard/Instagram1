class LikesController < ApplicationController
  # def create
    # @picture = Picture.find(params[:picture])
    # @picture.likes.create
    # redirect_to pictures_path
    # render json: {new_like_count: @post.likes.count}
  # end
  def index
    redirect_to pictures_path
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    redirect_to pictures_path
  end
end
