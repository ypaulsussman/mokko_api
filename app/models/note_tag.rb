class NoteTag < ApplicationRecord
  belongs_to :prompt
  belongs_to :note
end
