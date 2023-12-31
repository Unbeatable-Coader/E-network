class RoomsController < ApplicationController

  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.except(@current_user)
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def show
    @message = Message.new
    @current_user = current_user
    @single_room = Room.find(params[:id])
    puts "single room = #{@single_room}"
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @messages = @single_room.messages
    puts "message = #{@messages}"

    render "index"
  end

end
