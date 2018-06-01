class EventsController < ApplicationController
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
    @events = Event.all.order('date')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event created successfully'
      redirect_to @event
    else
      flash.now[:alert] = @event.errors.full_messages
      render :new
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
      flash[:notice] = 'Event updated successfully'
      redirect_to @event
    else
      flash.now[:alert] = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:notice] = 'Event deleted successfully'
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description, :ticketed)
  end
end
