# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :deck
  has_many :interrogations
  has_many :note_prompts
  has_many :prompts, through: :note_prompts
  has_many :note_tags
  has_many :tags, through: :note_tags
end
