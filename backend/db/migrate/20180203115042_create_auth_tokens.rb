class CreateAuthTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tokens, id: :uuid do |t|
      t.string :token, null: false, uniq: true
      t.text :public_key, null: false

      t.timestamps
    end
    add_index :auth_tokens, :token
  end
end
