class AlarmController < ApplicationController

  def new 
    
  end

  def create
    @alarm = Alarm.new(new_alarm_params)
    
  end

  def update
    if @alarm.update(edit_group_params)
      redirect_to alarm_path, notice: "Alarm is set"
    else
      render "edit"
    end
  end

  def show
    @alarm = Alarms.all
  end


  private
  
  def new_alarm_params
    params.permit(:name, :time, :days, :snooze)
  end
  def edit_alarm_params
    params.permit(:name, :time, :days, :snooze)
  end
end
