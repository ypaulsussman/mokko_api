# frozen_string_literal: true

class CreateNoteTags < ActiveRecord::Migration[6.1]
  def change
    create_table :note_tags, id: :uuid do |t|
      t.references :prompt, null: false, foreign_key: true, type: :uuid
      t.references :note, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
