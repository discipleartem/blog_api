# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :article_id, null: false
      t.integer :user_id, null: false
      t.text :body, null: false

      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :user_id
  end
end
