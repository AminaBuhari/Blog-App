class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :author_id
      t.text :text

      t.timestamps
    end
  end
end
