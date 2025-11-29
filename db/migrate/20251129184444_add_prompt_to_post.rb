class AddPromptToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :prompt, :text
  end
end
