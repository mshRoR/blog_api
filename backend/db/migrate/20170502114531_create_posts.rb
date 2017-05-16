class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts, id: :uuid, comment: 'Store All Posts' do |t|
      t.string :title, null: false, comment: 'Post Title'
      t.text :description, null: false, comment: 'Post Description'

      t.timestamps
    end
  end
end
