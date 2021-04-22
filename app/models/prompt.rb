# frozen_string_literal: true

class Prompt < ApplicationRecord
  has_many :interrogations
  has_many :note_prompts
  has_many :notes, through: :note_prompts

  validates :content, presence: true
end
