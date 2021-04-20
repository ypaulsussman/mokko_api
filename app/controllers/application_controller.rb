# frozen_string_literal: true

require 'json_web_token'

class ApplicationController < ActionController::API
  before_action :authenticate_request

  def initialize
    @current_user = nil
    @errors = {}
  end

  def lander
    render json: { your_token: 'is rad!' }
  end

  private

  def authenticate_request
    @current_user = find_user

    render(json: { error: @errors }, status: 401) unless @current_user
  end

  def find_user
    token = JsonWebToken.decode(auth_header)
    puts "=>=>=>=>=>=> token: #{token}"
    puts "=>=>=>=>=>=> uuid: #{token[:user_id]}"
    return User.find(token[:user_id]) if token.present?

    @errors[:token] ||= 'Invalid'
    nil
  end

  def auth_header
    auth = request.headers['Authorization']
    puts "=>=>=>=>=>=> auth: #{auth}, and split:#{auth.split('.').last}"
    return auth.split('.').last if auth.present?

    @errors[:token] = 'Missing'
    nil
  end
end
