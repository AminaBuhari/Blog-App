class RemoveTimeStampFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :timestamp, :string
  end
end
