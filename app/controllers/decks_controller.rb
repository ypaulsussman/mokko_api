# frozen_string_literal: true

class DecksController < ApplicationController
  # GET /decks
  def index
    @decks = @current_user.decks.includes(:notes)

    render json: @decks.as_json(include: :notes)
  end

  # GET /decks/1
  # def show
  #   render json: @deck
  # end

  # POST /decks
  # def create
  #   @deck = Deck.new(deck_params)
  #   if @deck.save
  #     render json: @deck, status: :created, location: @deck
  #   else
  #     render json: @deck.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /decks/1
  def update
    @deck = @current_user.decks.find(params[:id])

    if @deck.update(title: params[:title])
      render json: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1
  def destroy
    @deck = @current_user.decks.find(params[:id])
    @deck.destroy
    render json: { destroyed_deck: @deck.title }
  end

  # private
  # Only allow a list of trusted parameters through.
  # def deck_params
  #   params.require(:deck).permit(:title, :user_id, :id)
  # end
end
