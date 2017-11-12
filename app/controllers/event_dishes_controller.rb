class EventDishesController < ApplicationController
  before_action :set_event_dish, only: [:update]

  def update
    @event_dish.update(claimed: true, user: current_user)
    redirect_to @event_dish.event
  end

  private
    def set_event_dish
      @event_dish = EventDish.find(params[:id])
    end
end
