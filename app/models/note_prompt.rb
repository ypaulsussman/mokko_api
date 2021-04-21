class NotePrompt < ApplicationRecord
  belongs_to :prompt
  belongs_to :note
end
