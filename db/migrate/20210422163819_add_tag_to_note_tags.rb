# frozen_string_literal: true

class AddTagToNoteTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :note_tags, :tag, null: false, foreign_key: true, type: :uuid
  end
end
