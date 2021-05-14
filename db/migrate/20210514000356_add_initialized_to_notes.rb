# frozen_string_literal: true

class AddInitializedToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :initialized, :boolean, default: false
  end
end
