# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes, id: :uuid do |t|
      t.references :deck, null: false, foreign_key: true, type: :uuid
      t.boolean :active
      t.date :next_occurrence
      t.integer :current_interval
      t.text :content

      t.timestamps
    end
  end
end
