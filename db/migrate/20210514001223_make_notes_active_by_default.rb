# frozen_string_literal: true

class MakeNotesActiveByDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :notes, :active, from: nil, to: true
  end
end
