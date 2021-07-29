# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.where(id:
      NoteTag.where(note_id:
        Note.where(deck_id:
          @current_user.decks)).select(:tag_id))
               .select(:id, :content)

    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tag_params
    params.require(:tag).permit(:content)
  end
end
