# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :user
  has_many :notes
end
