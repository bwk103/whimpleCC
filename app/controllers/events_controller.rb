class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      redirect_to edit_event_url(@event)
    end
  end

  def destroy
    Event.find(params[:id]).destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
