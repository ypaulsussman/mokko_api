# frozen_string_literal: true

require 'test_helper'

class DecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deck = decks(:one)
  end

  test 'should get index' do
    get decks_url, as: :json
    assert_response :success
  end

  test 'should create deck' do
    assert_difference('Deck.count') do
      post decks_url, params: { deck: { title: @deck.title, user_id: @deck.user_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show deck' do
    get deck_url(@deck), as: :json
    assert_response :success
  end

  test 'should update deck' do
    patch deck_url(@deck), params: { deck: { title: @deck.title, user_id: @deck.user_id } },
                           as: :json
    assert_response 200
  end

  test 'should destroy deck' do
    assert_difference('Deck.count', -1) do
      delete deck_url(@deck), as: :json
    end

    assert_response 204
  end
end
