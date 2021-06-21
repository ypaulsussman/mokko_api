# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :title, presence: true
end
