# frozen_string_literal: true

class AddPromptsRemainingToNotes < ActiveRecord::Migration[6.1]
  def change
    Note.connection.execute('ALTER TABLE notes ADD COLUMN prompts_remaining uuid[];')
  end
end
