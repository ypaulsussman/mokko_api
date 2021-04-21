class InterrogationsController < ApplicationController
  before_action :set_interrogation, only: [:show, :update, :destroy]

  # GET /interrogations
  def index
    @interrogations = Interrogation.all

    render json: @interrogations
  end

  # GET /interrogations/1
  def show
    render json: @interrogation
  end

  # POST /interrogations
  def create
    @interrogation = Interrogation.new(interrogation_params)

    if @interrogation.save
      render json: @interrogation, status: :created, location: @interrogation
    else
      render json: @interrogation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interrogations/1
  def update
    if @interrogation.update(interrogation_params)
      render json: @interrogation
    else
      render json: @interrogation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interrogations/1
  def destroy
    @interrogation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interrogation
      @interrogation = Interrogation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interrogation_params
      params.require(:interrogation).permit(:note_id, :prompt_id, :content, :occurred_on)
    end
end
