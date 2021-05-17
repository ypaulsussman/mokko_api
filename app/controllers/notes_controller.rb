# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # GET /notes/overview
  def overview
    upcoming_notes = Note.upcoming_for(Deck.where(user_id: @current_user))
    render json: upcoming_notes
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # POST /notes/review
  def review
    # @TODO:
    # 1. grab all note id's from users' decks
    # 2. loop through all id's sent from client
    # 3. if any id's sent from client don't match, return `403`

    base_notes = Note.where({ id: params[:today] }).includes(:deck, :tags)
    send_prompts = false
    notes_with_cues = base_notes.map do |note|
      if note.prompts_remaining.first.nil?
        # @TODO: ensure repeat cards aren't chosen (set that on submit of new
        # interrogation, though, not here. And how to keep it - join table?)
        note.cue_note = Note.where.not({ id: params[:today] }).includes(:deck,
                                                                        :tags)
      else
        send_prompts = true
      end
      note
    end

    render json: if send_prompts
                   { notes: notes_with_cues,
                     prompts: Prompt.all }
                 else
                   { notes: notes_with_cues }
                 end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:deck_id, :active, :next_occurrence, :current_interval, :content)
  end
end
