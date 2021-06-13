class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :message
      t.string :sid
      t.string :fbid

      t.timestamps
    end
  end
end
