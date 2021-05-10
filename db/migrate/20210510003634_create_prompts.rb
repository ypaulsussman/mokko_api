# frozen_string_literal: true

class CreatePrompts < ActiveRecord::Migration[6.1]
  def change
    create_table :prompts, id: :uuid do |t|
      t.text :content

      t.timestamps
    end
  end
end
