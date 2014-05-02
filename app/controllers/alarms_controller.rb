class AlarmsController < ApplicationController
  before_action :require_user
  def show
    
  end
  # GET /alarms/new
  def new
    @alarm = Alarm.new
  end
  # GET /alarms/1/edit
  def edit
  end
  # POST /alarms
  # POST /alarms.json
  def create
    @alarm = Alarm.new(alarm_params)
    respond_to do |format|
      @alarm.user = current_user
      if @alarm.save
        format.html { redirect_to user_path(current_user), notice: 'Alarm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alarm }
      else
        format.html { render action: 'new' }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /alarms/1
  # PATCH/PUT /alarms/1.json
  def update
    respond_to do |format|
      if @alarm.update(alarm_params)
        format.html { redirect_to user_path(current_user), notice: 'Alarm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /alarms/1
  # DELETE /alarms/1.json
  def destroy
    @alarm.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end
  private 
    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:alarm).permit(:name, :user, :time, :snooze, days: [])
    end
end
