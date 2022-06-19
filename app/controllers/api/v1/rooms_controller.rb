class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all.order('created_at ASC')
    render json: @rooms.as_json(only: %i[id name number], include: [:schedulings])
  end

  def show
    @room = Room.find(params[:id])
    render json: @room.as_json(only: %i[id name number], include: [:schedulings])
  end
end
