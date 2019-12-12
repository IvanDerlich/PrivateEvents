# frozen_string_literal: true

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
    events = Event.all.order('created_at desc')
    @upcoming_events = events.upcoming_events
    @past_events = events.previous_events
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
