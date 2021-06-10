class CreateForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :forecasts do |t|
      t.text :data

      t.timestamps
    end
  end
end
