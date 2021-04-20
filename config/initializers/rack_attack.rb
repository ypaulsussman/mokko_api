# frozen_string_literal: true

# Keep It Simple:
# https://github.com/kickstarter/rack-attack/blob/master/docs/example_configuration.md

module Rack
  class Attack
    ### Throttle Spammy Clients ###
    # Throttle all requests by IP (60rpm)
    # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
    throttle('req/ip', limit: 300, period: 5.minutes, &:ip)

    ### Prevent Brute-Force Login Attacks ###
    # Throttle POST requests to /login by IP address
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
    throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
      req.ip if req.path == '/login' && req.post?
    end

    # Throttle POST requests to /login by email param
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/email:#{req.email}"
    throttle('logins/email', limit: 5, period: 20.seconds) do |req|
      if req.path == '/login' && req.post?
        # return the email if present, nil otherwise
        req.params['email'].presence
      end
    end
  end
end
