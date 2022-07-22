class RemoveUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_password, :string, default: "", null: false 
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :email, :string, default: "", null: false 
    remove_column :users, :username, :string, :limit=> 25
    
  end
end
