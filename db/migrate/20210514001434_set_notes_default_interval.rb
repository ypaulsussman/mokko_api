# frozen_string_literal: true

class SetNotesDefaultInterval < ActiveRecord::Migration[6.1]
  def change
    change_column_default :notes, :current_interval, from: nil, to: 1
  end
end
