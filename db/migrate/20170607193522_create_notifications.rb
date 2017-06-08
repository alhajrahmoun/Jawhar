class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true, foreign_key: { to_table: :users }
      t.references :commenter, foreign_key: true, foreign_key: { to_table: :users }
      t.integer :comment_id
      t.references :gist, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
