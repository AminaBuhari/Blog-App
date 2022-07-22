class RemoveIntFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :int, :string
  end
end
