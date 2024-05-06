class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @attended_past_events = @user.attended_events.where('date < ?', Date.today)
      @attended_future_events = @user.attended_events.where('date >= ?', Date.today)
    end
    
    def index
      @users = User.all
    end
  end
  