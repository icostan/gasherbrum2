class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :email
      t.string :format
      t.datetime :send_at

      t.timestamps
    end
    add_index :notifications, :email, unique: true
  end
end
