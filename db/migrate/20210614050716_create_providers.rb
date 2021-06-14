class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :endpoint
      t.string :elevation
      t.boolean :disabled

      t.timestamps
    end
  end
end
