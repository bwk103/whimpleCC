class EventsController < ApplicationController
  def index
    @events = Event.all.order('date')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event created successfully"
      redirect_to @event
    else
      flash[:alert] = @event.errors.full_messages
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
      flash[:notice] = "Event updated successfully"
      redirect_to @event
    else
      flash[:alert] = @event.errors.full_messages
      redirect_to edit_event_url(@event)
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:notice] = "Event deleted successfully"
    redirect_to events_url

  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
