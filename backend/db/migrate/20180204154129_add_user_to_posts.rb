class AddUserToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user, foreign_key: true, index: true, type: :uuid
  end
end
