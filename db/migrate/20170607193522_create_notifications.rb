class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :content
      t.string :notifiable_type
      t.integer :notifiable_id
      t.integer :recipient_id
      t.integer :notifier_id
      t.boolean :read, default: false

      t.timestamps
    end

    add_index :notifications, :recipient_id
  end
end
