class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy, :update]

  def index
    if logged_in? 
      @events = Event.where('date > ?', Date.today).order(:date => :asc)
    else
      redirect_to login_path
    end
  end

  def new
    @event = Event.new
  end

  def create
    event = current_user.events.build(event_params)

    if event.save
      redirect_to event
    else
      redirect_to new_event_path
    end
  end

  def update
    ed = @event.event_dishes.build(dish_id: params[:dish_id], user: current_user, claimed: true)
    if ed.save
      redirect_to @event
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    end
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
    @dishes  = Dish.all
  end

  private
    def event_params
      params.require(:event).permit(:text, :date, :street, :city, :state, :zip)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
