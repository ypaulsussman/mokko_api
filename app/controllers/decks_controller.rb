# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :update, :destroy]

  # GET /decks
  def index
    @decks = @current_user.decks

    render json: @decks
  end

  # GET /decks/1
  def show
    render json: @deck
  end

  # POST /decks
  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      render json: @deck, status: :created, location: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /decks/1
  def update
    if @deck.update(deck_params)
      render json: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1
  def destroy
    @deck.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deck_params
    params.require(:deck).permit(:title, :user_id)
  end
end
