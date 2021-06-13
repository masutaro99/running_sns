class PracticesController < ApplicationController
  def index
    @practices = Practice.all
    render json: @practices
  end
  def create
    @practice = Practice.new(practice_params)

    if @practice.save
      render json: @practice, status: :created, location: @practice
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def practice_params
      params.require(:practice).permit(:title, :description, :distance)
    end
end
