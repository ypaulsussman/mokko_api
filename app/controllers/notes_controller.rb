# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  MAX_SESSION_NOTES = 4

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  # POST /notes/review
  def review
    base_notes = Note.upcoming_for(@current_user.decks)

    if base_notes.length < MAX_SESSION_NOTES
      total_needed = MAX_SESSION_NOTES - base_notes.length
      base_notes += Note.uninitialized_for(@current_user.decks, total_needed)
    end

    send_prompts = false
    notes_with_cues = base_notes.map do |note|
      if note.prompts_remaining.first.nil?
        note.cue_note =
          Note
          .where.not({ id: params[:today] + note.previous_cue_notes })
          .includes(:deck, :tags)
          .first
      else
        send_prompts = true
      end
      note
    end

    render json: if send_prompts
                   { notes: notes_with_cues.as_json(include: [:deck, :tags]),
                     prompts: Prompt.all }
                 else
                   { notes: notes_with_cues.as_json(include: [:deck, :tags]) }
                 end
  end

  # GET /notes/1
  def show
    render json: @note.as_json(include: [:deck, :tags, :mokkos])
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note.as_json(include: [:deck, :tags, :mokkos])
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private

  def set_note
    @note =
      Note
      .includes(:deck, :tags, :mokkos)
      .find_by(id: params[:id], deck_id: @current_user.decks)

    render(json: {}, status: :not_found) and return if @note.nil?
  end

  def note_params
    params.require(:note).permit(:deck_id, :active, :next_occurrence, :current_interval, :content)
  end
end
