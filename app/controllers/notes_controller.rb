# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  MAX_SESSION_NOTES = 4

  # POST /notes
  # def create
  #   @note = Note.new(note_params)
  #   if @note.save
  #     render json: @note, status: :created, location: @note
  #   else
  #     render json: @note.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /notes/1
  def destroy
    @note.destroy
    render json: { destroyed_note: @note.id }
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
    render json: { note: @note.as_json(include: [:deck, :tags, :mokkos]),
                   selectable_decks: @current_user.decks.select(:id, :title),
                   selectable_tags:
                   Tag.where(id:
                     NoteTag.where(note_id:
                       Note.where(deck_id:
                         @current_user.decks)).select(:tag_id))
                      .select(:id, :content) }
  end

  # PATCH/PUT /notes/1
  def update
    ActiveRecord::Base.transaction do
      @note.update!(note_params)

      if params[:tagsToRemove].length.positive?
        remove_ids = params[:tagsToRemove].map do |tag|
          tag['id']
        end
        NoteTag.destroy_by(note_id: @note, tag_id: remove_ids)
      end

      if params[:tagsToAdd].length.positive?
        params[:tagsToAdd].map do |tag|
          if tag['id'].nil?
            new_tag = Tag.create!(content: tag['content'])
            NoteTag.create!(note_id: @note.id, tag_id: new_tag.id)
          else
            NoteTag.create!(note_id: @note.id, tag_id: tag['id'])
          end
        end
      end
    end

    render json: { note: Note.find_by(id: @note).as_json(include: [:deck, :tags, :mokkos]),
                   selectable_decks: @current_user.decks.select(:id, :title),
                   selectable_tags:
                    Tag.where(id:
                      NoteTag.where(note_id:
                        Note.where(deck_id:
                          @current_user.decks)).select(:tag_id))
                       .select(:id, :content) }
  rescue StandardError => e
    render json: { errors: e }, status: :unprocessable_entity
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
    params.permit(:id, :deck_id, :active, :next_occurrence, :current_interval, :content)
  end
end
