class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = Event.order(:date => :asc)
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

  def show

  end

  private
    def event_params
      params.require(:event).permit(:text, :date, :street, :city, :state, :zip)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
