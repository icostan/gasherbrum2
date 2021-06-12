class Notification < ApplicationRecord
  scope :active, -> { where(disabled: [nil, false]) }
end
