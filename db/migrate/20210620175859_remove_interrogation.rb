# frozen_string_literal: true

class RemoveInterrogation < ActiveRecord::Migration[6.1]
  def change
    drop_table :interrogations
  end
end
