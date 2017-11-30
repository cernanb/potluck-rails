class Dish < ApplicationRecord
  has_many :event_dishes, dependent: :destroy
  has_many :events, through: :event_dishes
end
