# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :user
  has_many :notes

  validates :title, presence: true
end
