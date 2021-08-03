# frozen_string_literal: true

class CreateAccessTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :access_tokens do |t|
      t.integer :user_id, null: false
      t.string :token

      t.timestamps
    end
    add_index :access_tokens, %i[user_id token], unique: true
    add_index :access_tokens, :user_id
  end
end
