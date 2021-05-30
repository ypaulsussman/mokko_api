# frozen_string_literal: true

class AddCuesToInterrogations < ActiveRecord::Migration[6.1]
  def change
    add_reference :interrogations, :cue, null: false, type: :uuid
    add_column :interrogations, :cue_from_prompt, :boolean
  end
end
