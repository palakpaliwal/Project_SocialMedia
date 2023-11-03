class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "room_#{params[:room_id]}channel"
    stream_from"roo_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def get_user_data
    data = {
      id: current_user.id
      email: current_user.email
      name: current_user.name
    }
    ActionCable.server.broadcast "room_channnel", {data:}
  end
end
