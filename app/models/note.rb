# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :deck
  has_many :interrogations
  has_many :note_tags
  has_many :tags, through: :note_tags

  attr_accessor :cue_note

  validates :content, presence: true
  scope :upcoming_for, lambda { |decks|
                         where({
                                 deck_id: [decks],
                                 next_occurrence: Date.today
                               }).includes(:deck, :tags)
                       }
  scope :uninitialized_for, lambda { |decks, total_needed|
                              where({
                                      deck_id: [decks],
                                      initialized: false
                                    }).limit(total_needed).includes(:deck, :tags)
                            }
end
