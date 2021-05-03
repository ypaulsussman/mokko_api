# frozen_string_literal: true

require 'test_helper'

class InterrogationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interrogation = interrogations(:one)
  end

  test 'should get index' do
    get interrogations_url, as: :json
    assert_response :success
  end

  test 'should create interrogation' do
    assert_difference('Interrogation.count') do
      post interrogations_url,
           params: { interrogation: { content: @interrogation.content,
                                      note_id: @interrogation.note_id,
                                      occurred_on: @interrogation.occurred_on } }, as: :json
    end

    assert_response 201
  end

  test 'should show interrogation' do
    get interrogation_url(@interrogation), as: :json
    assert_response :success
  end

  test 'should update interrogation' do
    patch interrogation_url(@interrogation),
          params: { interrogation: { content: @interrogation.content,
                                     note_id: @interrogation.note_id,
                                     occurred_on: @interrogation.occurred_on } }, as: :json
    assert_response 200
  end

  test 'should destroy interrogation' do
    assert_difference('Interrogation.count', -1) do
      delete interrogation_url(@interrogation), as: :json
    end

    assert_response 204
  end
end
