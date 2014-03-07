class AlarmsController < ApplicationController

  def new 
    @alarm = Alarm.new
  end

  def create
    if @alarm = Alarm.create(new_alarm_params)
       redirect_to root_path
    else
      render "new"
    end
  end
=begin
  def update
    if @alarm.update(edit_group_params)
      redirect_to alarm_path, notice: "Alarm is set"
    else
      render "edit"
    end
  end
=end
  def show
    @alarms = Alarm.all
  end


  private
  
  def new_alarm_params
    params.permit(:name, :time, :days, :snooze)
  end
end
