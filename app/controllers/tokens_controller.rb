# frozen_string_literal: true

class TokensController < ApplicationController
  skip_before_action :authenticate_request

  def create
    token = authenticate_user
    render(json: { auth_token: token }) && return if token.present?

    error_msg = { error: { login: 'invalid credentials' } }
    render(json: error_msg, status: :unauthorized)
  end

  private

  def authenticate_user
    return nil unless (user = User.find_by_email(params[:email]))

    JsonWebToken.encode(user_id: user.id) if user.authenticate(params[:password])
  end
end
