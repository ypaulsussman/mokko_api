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

    # @TODO: remind yourself how basic-hash key-lookup/mutation works in Ruby.
    # Or don't; you do you
    # overview_data = upcoming_notes.each_with_object({ today: 0, tomorrow: 0,
    #                                                   rest_of_week: 0 }) do |note, data|
    #   if note.next_occurrence == Date.today
    #     data[today] = (data[today] + 1)
    #   elsif note.next_occurrence == (Date.today + 1.day)
    #     data[tomorrow] = (data[tomorrow] + 1)
    #   else
    #     data[rest_of_week] = (data[rest_of_week] + 1)
    #   end
    # end
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
