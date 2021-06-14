class AddElevationToForecast < ActiveRecord::Migration[6.1]
  def change
    add_column :forecasts, :elevation, :string
  end
end
