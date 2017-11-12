class Event < ApplicationRecord
  belongs_to :user
  has_many :event_dishes
  has_many :dishes, through: :event_dishes

  def unclaimed_dishes
    event_dishes.where(claimed: false)
  end

  def claimed_dishes
    event_dishes.where(claimed: true)
  end

end
