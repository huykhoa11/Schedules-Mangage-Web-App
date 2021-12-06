class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: :login_check
  #before_action :correct_user, only: [:edit, :update, :find, :destroy]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  def login_check
    @schedules = Schedule.all
  end

 def find
    #@schedules = Schedule.all
    @schedules = current_user.schedules
    @schedules = Array.new
    if request.post? then
      @schedules = Schedule.where "title like ?",'%' + params[:find] + '%'
    end
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  def about
  end

  # GET /schedules/new
  def new
    #@schedule = Schedule.new
    @schedule = current_user.schedules.build  
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    #@schedule = Schedule.new(schedule_params)
    @schedule = current_user.schedules.build(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @schedule = current_user.schedules.find_by(id: params[:id])
    #redirect_to schedules_path, notice: "Please login first !" if @schedule.nil?
    redirect_to "/schedules/login_check", notice: "PLEASE LOGIN FIRST !" if @schedule.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:title, :day, :lecture, :room, :lesson, :user_id)
    end

end
