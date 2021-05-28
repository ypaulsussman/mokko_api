# frozen_string_literal: true

class AddPreviousCueNotesToNotes < ActiveRecord::Migration[6.1]
  def change
    Note.connection.execute('ALTER TABLE notes ADD COLUMN previous_cue_notes uuid[];')
  end
end
