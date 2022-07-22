class AlterUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :username, :string, :limit=> 25, :after => :email 
    add_column :users, :email, :string, default: "", null: false 
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :reset_password_created_at, :string
    add_column :users, :encrypted_password, :string, default: "", null: false 
    
  end

  def down 
    remove_column :users, :encrypted_password, :string, default: "", null: false 
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :reset_password_created_at, :string
    remove_column :users, :email, :string, default: "", null: false 
    remove_column :users, :username, :string, :limit=> 25
  end 
end
