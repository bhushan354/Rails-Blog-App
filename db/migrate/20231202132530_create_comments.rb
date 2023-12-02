class CreateComments < ActiveRecord::Migration[7:1]
    def change
        create_table :comments do |t|
            t.integer :post_id, numm: false
            t.integer :user_id, null: false
            t.text :text

            t.foreign_key :posts
            t.foreign_key :users

            t.index :post_id
            t.index :user_id

            t.timestamps
        end
    end
end
