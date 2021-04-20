# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload, exp = 2.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(
        payload,
        Rails.application.secret_key_base,
        'HS256',
        { typ: 'JWT' }
      )
    end

    def decode(token)
      body =
        JWT.decode(token, Rails.application.secret_key_base)
      puts "body: #{body}"
      HashWithIndifferentAccess.new(body.first)
    rescue JWT::DecodeError => e
      puts "decode error: #{e}"
      nil
    end
  end
end
