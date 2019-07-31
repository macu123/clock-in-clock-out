class ClockEventsController < ApplicationController
  before_action :set_clock_event, only: [:edit, :update, :destroy]

  def checkin
    clock_event = current_user.clock_events.new
    clock_event.checkin_at = Time.now
    clock_event.save
  end

  def checkout
    clock_event = current_user.clock_events.not_checkout_yet.last
    clock_event.checkout_at = Time.now
    clock_event.save
  end

  def edit
  end

  def update
    if @clock_event.update(clock_event_params)
      redirect_to clock_events_url, notice: "Clock Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @clock_event.destroy
    redirect_to clock_events_url, notice: "Clock Event was successfully destroyed."
  end

  private
  def set_clock_event
    @clock_event = ClockEvent.find(params[:id])
  end

  def clock_event_params
    params.require(:clock_event).permit(:checkin_at, :checkout_at)
  end
end
