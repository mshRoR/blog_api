class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid, comment: 'User Details' do |t|
      t.string :name, null: false
      t.string :email, null: false, uniq: true
      t.string :username, null: false, index: true, uniq: true
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
