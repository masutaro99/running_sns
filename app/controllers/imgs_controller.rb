class ImgsController < ApplicationController
  def index
    @imgs = Img.all
    render json: @imgs
  end
  def show
    @img = Img.find_by(username: params[:username])
    render json: @img
  end
  def create
    @img = Img.new(img_params)
    if @img.save
      render json: @img, status: :created, location: @img
    else
      render json: @img.errors, status: :unprocessable_entity
    end
  end
  def update
    @img = Img.find_by(username: params[:username])
    @img.update(img_params)
    render json: @img, status: :created, location: @img
  end
  def destroy
    @img = Img.find_by(username: params[:username])
    @img.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def img_params
      params.permit(:username, :imagepath)
    end
end
