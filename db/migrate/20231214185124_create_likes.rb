class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.index :user_id
      t.index :post_id

      t.timestamps
    end
  end
end
