# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :note_tags, dependent: :destroy
  has_many :notes, through: :note_tags

  validates :content, presence: true
end
