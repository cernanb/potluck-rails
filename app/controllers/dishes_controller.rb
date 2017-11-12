class DishesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @dish = @event.dishes.build(dish_params)
    if @event.save
      redirect_to @event
    end
  end

  private
    def dish_params
      params.require(:dish).permit(:name)
    end
end
