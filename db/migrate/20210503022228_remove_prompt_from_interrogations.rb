class RemovePromptFromInterrogations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :interrogations, :prompt, null: false, foreign_key: true, type: :uuid
  end
end
