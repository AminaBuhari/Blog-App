class RemovePostConterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :post_conter, :integer
  end
end
