# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :decks, dependent: :destroy
end
