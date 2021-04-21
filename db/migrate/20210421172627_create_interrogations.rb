# frozen_string_literal: true

class CreateInterrogations < ActiveRecord::Migration[6.1]
  def change
    create_table :interrogations, id: :uuid do |t|
      t.references :note, null: false, foreign_key: true, type: :uuid
      t.references :prompt, foreign_key: true, type: :uuid
      t.string :content
      t.date :occurred_on

      t.timestamps
    end
  end
end
