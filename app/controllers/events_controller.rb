require 'time'
class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.date = Time.now.to_s
    if @event.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:description)
  end
end
