class DropPrompts < ActiveRecord::Migration[6.1]
  def change
    drop_table :note_prompts
    drop_table :prompts
  end
end
