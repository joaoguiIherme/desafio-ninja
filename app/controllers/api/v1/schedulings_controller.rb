class Api::V1::SchedulingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: %i[show update destroy]
  before_action :set_room, only: %i[create]

  def index
    @meetings = Scheduling.all.order('created_at ASC')
    render json: @meetings.as_json(only: %i[room_id user_id start_time end_time])
  end

  def show
    render json: @meeting.as_json(only: %i[room_id user_id start_time end_time])
  end

  def create
    meeting = Scheduling.new(create_params)
    check_validation meeting
    meeting.room_id = @room.id
    meeting.user_id = current_user.id

    if meeting.save
      render json: meeting.as_json, status: :created
    else
      render json: meeting.errors, status: :unprocessable_entity
    end
  end

  def update
    # @meeting.start_time = update_params[:start_time]
    # @meeting.end_time = update_params[:end_time]
    # check_validation @meeting
    @meeting.update(update_params)
    if check_validation @meeting
      render json: @meeting.as_json
    else
      render json: @meeting.errors.full_messages
    end
  end

  def check_validation(instance)
    times = TimeManagement.new
    rooms_managment = RoomsManagement.new
    @room ||= Room.find_by_id(@meeting.room_id)
    times.comercial? instance.start_time, instance.end_time
    rooms_managment.available? @room, instance.start_time, instance.end_time, instance.id
  end

  def destroy
    @meeting.destroy
    render json: 'Deletada com sucesso!'
  end

  private

  def set_schedule
    @meeting = Scheduling.find(find_params[:id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def find_params
    params.permit(:id)
  end

  def create_params
    params.require(:scheduling).permit(:start_time, :end_time)
  end

  def update_params
    params.require(:scheduling).permit(:start_time, :end_time, :id)
  end
end
