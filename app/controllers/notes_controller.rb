# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  MAX_SESSION_NOTES = 4
  NOTES_PER_PAGE = 6

  # POST /notes
  def create
    ActiveRecord::Base.transaction do
      @note = Note.create!(note_params)

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
                   tags:
                    Tag.where(id:
                      NoteTag.where(note_id:
                        Note.where(deck_id:
                          @current_user.decks)).select(:tag_id))
                       .select(:id, :content) }
  rescue StandardError => e
    render json: { errors: e }, status: :unprocessable_entity
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    render json: { destroyed_note: @note.id }
  end

  # GET /notes
  def index
    @notes = Note
             .where(deck_id: @current_user.decks)
             .limit(NOTES_PER_PAGE)
             .offset((params['page'].to_i - 1) * NOTES_PER_PAGE)

    render json: { notes: @notes, note_count: Note.where(deck_id: @current_user.decks).length }
  end

  # POST /notes/review
  def review
    base_notes = Note.upcoming_for(@current_user.decks)

    if base_notes.length < MAX_SESSION_NOTES
      total_needed = MAX_SESSION_NOTES - base_notes.length
      base_notes += Note.uninitialized_for(@current_user.decks, total_needed)
    end

    notes_with_cues = base_notes.map do |note|
      # @TODO: revert this change post-MVP, when you'd like to experiment more
      # with non-note content as the "cue" for mokko-generation
      # if note.prompts_remaining.first.nil?
      note.cue_note =
        Note
        .where.not({ id: note.previous_cue_notes })
        .includes(:deck, :tags)
        .first
      # end
      note
    end

    render json: { notes: notes_with_cues.as_json(include: [:deck, :tags, :cue_note]),
                   prompts: Prompt.all }
  end

  # GET /notes/1
  def show
    render json: { note: @note.as_json(include: [:deck, :tags, :mokkos]),
                   selectable_decks: @current_user.decks.select(:id, :title),
                   tags:
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
                   tags:
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
