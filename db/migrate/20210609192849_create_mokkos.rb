# frozen_string_literal: true

class CreateMokkos < ActiveRecord::Migration[6.1]
  def change
    create_table :mokkos, id: :uuid do |t|
      t.string :content
      t.boolean :cue_from_prompt

      t.references :note, null: false, foreign_key: true, type: :uuid
      t.references :cue, null: false, type: :uuid

      t.timestamps
    end
  end
end
