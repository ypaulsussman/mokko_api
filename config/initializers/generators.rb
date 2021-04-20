# frozen_string_literal: true

# See https://pawelurbanek.com/uuid-order-rails and
# migration 20210420170948_enable_uuid.rb
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
