class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      @events = Event.all
    end
  
    def new
      @user = User.find(params[:user_id])
      @event = @user.events.build
    end
  
    def create
      @user = User.find(params[:user_id])
      @event = @user.events.build(event_params)
      if @event.save
        redirect_to user_path(@user), notice: 'Event created successfully.'
      else
        render :new
      end
    end
  
    def edit
      @event = current_user.events.find(params[:id])
    end
  
    def update
      @event = current_user.events.find(params[:id])
      if @event.update(event_params)
        redirect_to user_path(current_user), notice: 'Event updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @event = current_user.events.find(params[:id])
      @event.destroy
      redirect_to user_path(current_user), notice: 'Event deleted successfully.'
    end
  
    def remove_attendee
      @attendance = current_user.attendances.find(params[:attendance_id])
      @event = @attendance.event
      if @attendance.destroy
        redirect_to @event, notice: 'You have been removed from the event.'
      else
        redirect_to @event, alert: 'Failed to remove you from the event.'
      end
    end
  
    private
  
    def event_params
      params.require(:event).permit(:name, :date, :location)
    end
  end
  