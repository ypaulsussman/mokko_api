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
    ActiveRecord::Base.transaction do
      @interrogation = Interrogation.new
      @interrogation.note_id = params[:noteId]
      @interrogation.cue_id = params[:cueId]
      @interrogation.cue_from_prompt = params[:cueIsPrompt]
      @interrogation.content = params[:mokkoValue]
      @interrogation.save!

      interval = params[:mokkoInterval].to_i

      @note = Note.find_by(id: params[:noteId])
      @note.current_interval = interval
      @note.next_occurrence = Date.today + interval.days
      @note.initialized = true unless @note.initialized
      if params[:cueIsPrompt]
        @note.prompts_remaining = @note.prompts_remaining.reject { |id| id == params[:cueId] }
      end
      @note.save!
    end
    render json: { note: params[:noteId] }, status: :created
  rescue StandardError => e
    render json: { errors: e }, status: :unprocessable_entity
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
    params.permit(:noteId, :cueId, :cueIsPrompt, :mokkoValue, :mokkoInterval, :content,
                  :occurred_on)
  end
end
