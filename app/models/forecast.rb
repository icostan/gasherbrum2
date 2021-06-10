class Forecast < ApplicationRecord
  serialize :data, Array
end
