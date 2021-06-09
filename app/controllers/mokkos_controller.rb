# frozen_string_literal: true

class MokkosController < ApplicationController
  before_action :set_mokko, only: [:show, :update, :destroy]

  # GET /mokkos
  def index
    @mokkos = Mokko.all

    render json: @mokkos
  end

  # GET /mokkos/1
  def show
    render json: @mokko
  end

  # POST /mokkos
  def create
    ActiveRecord::Base.transaction do
      @mokko = Mokko.new
      @mokko.note_id = params[:noteId]
      @mokko.cue_id = params[:cueId]
      @mokko.cue_from_prompt = params[:cueIsPrompt]
      @mokko.content = params[:mokkoValue]
      @mokko.save!

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

  # PATCH/PUT /mokkos/1
  def update
    if @mokko.update(mokko_params)
      render json: @mokko
    else
      render json: @mokko.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mokkos/1
  def destroy
    @mokko.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mokko
    @mokko = Mokko.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mokko_params
    params.fetch(:mokko, {})
  end
end
