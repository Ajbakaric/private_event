class AttendancesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      event = Event.find(params[:event_id])
      current_user.attendances.create(event: event)
      redirect_to event, notice: 'You have successfully joined the event.'
    end
  
    def destroy
      attendance = current_user.attendances.find_by(event_id: params[:event_id])
      attendance.destroy
      redirect_to event, notice: 'You have successfully left the event.'
    end
  end
  