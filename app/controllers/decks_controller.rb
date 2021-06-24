# frozen_string_literal: true

class DecksController < ApplicationController
  # GET /decks
  def index
    @decks = @current_user.decks.includes(:notes)

    render json: @decks.as_json(include: :notes)
  end

  # POST /decks
  def create
    @deck = Deck.new(title: params[:title], user: @current_user)
    if @deck.save
      render json: @deck, status: :created
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

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
end
