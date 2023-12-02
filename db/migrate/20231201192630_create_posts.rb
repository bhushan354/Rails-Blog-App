class CreatePosts < ActiveRecord::Migration[7.1]
    def change
        create_table :posts do |t|
            t.integer :author_id
            t.string :title
            t.text :text
            t.integer :comments_counter, default: 0
            t.integer :likes_counter, default: 0

            t.foreign_key :users, column: :author_id
            t.index :author_id
            t.timestamps
        end
    end
end