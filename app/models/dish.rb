class Dish < ApplicationRecord
  has_many :event_dishes
  has_many :events, through: :event_dishes
end
