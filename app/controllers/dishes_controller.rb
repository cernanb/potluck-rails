class DishesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @dish = @event.dishes.build(dish_params)
    ed = @event.event_dishes.build(dish: @dish, user: current_user, claimed: true)
    if @event.save && ed.save
      redirect_to @event
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    dish = Dish.find(params[:id])
    if dish.destroy
      redirect_to event
    end
  end

  private
    def dish_params
      params.require(:dish).permit(:name)
    end
end
