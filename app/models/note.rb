# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :deck
  has_many :interrogations
  has_many :note_tags
  has_many :tags, through: :note_tags

  validates :content, presence: true
  scope :upcoming_for, lambda { |decks|
                         where({
                                 deck_id: [decks],
                                 next_occurrence: Date.today..(Date.today + 7.days)
                               }).select(:id, :next_occurrence)
                       }

  # BASE_INTERVALS = [1, 2, 3, 5, 8, 13, 21].freeze
end
