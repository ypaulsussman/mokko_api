# frozen_string_literal: true

class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks, id: :uuid do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
