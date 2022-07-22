class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_created_at, :datetime
    remove_column :users, :reset_password_created_at, :string
  end
end
