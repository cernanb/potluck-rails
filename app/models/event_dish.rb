class EventDish < ApplicationRecord
  belongs_to :dish
  belongs_to :event
  belongs_to :user, optional: true
end
