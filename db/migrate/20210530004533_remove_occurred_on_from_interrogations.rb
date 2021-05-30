# frozen_string_literal: true

class RemoveOccurredOnFromInterrogations < ActiveRecord::Migration[6.1]
  def change
    remove_column :interrogations, :occurred_on
  end
end
