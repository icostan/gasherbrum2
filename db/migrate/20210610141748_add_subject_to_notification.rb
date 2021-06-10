class AddSubjectToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :subject, :string
    remove_index :notifications, :email
  end
end
