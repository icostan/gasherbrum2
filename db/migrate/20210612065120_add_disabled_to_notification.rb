class AddDisabledToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :disabled, :boolean
  end
end
