# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :deck
  has_many :interrogations
  has_many :note_tags
  has_many :tags, through: :note_tags

  validates :content, presence: true

  BASE_INTERVALS = [1, 2, 3, 5, 8, 13, 21].freeze
end
