class RemoveTextFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :text, :text
  end
end
