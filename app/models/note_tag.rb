# frozen_string_literal: true

class NoteTag < ApplicationRecord
  belongs_to :tag
  belongs_to :note
end
