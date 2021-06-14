class PracticesController < ApplicationController
  before_action :set_target_practice, only: %i[show update]

  def index
    @practices = Practice.all
    render json: @practices
  end
  def show
    @practice = Practice.find_by(id: params[:id])
    render json: @practice
  end
  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      render json: @practice, status: :created, location: @practice
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end
  def update
    @practice.update(practice_params)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_practice
      @practice = Practice.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def practice_params
      params.permit(:title, :description, :distance)
    end
end
