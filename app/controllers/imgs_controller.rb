class ImgsController < ApplicationController
  def index
    @imgs = Img.all
    render json: @imgs
  end
  def show
    @img = Img.find_by(username: params[:username])
    render json: @img
  end

  private
    # Only allow a trusted parameter "white list" through.
    def img_params
      params.permit(:username)
    end
end
