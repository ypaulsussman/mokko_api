# frozen_string_literal: true

class RemovePromptFromNoteTags < ActiveRecord::Migration[6.1]
  def change
    remove_reference :note_tags, :prompt, null: false, foreign_key: true, type: :uuid
  end
end
