module ApplicationCable
  class MyChannel < ApplicationCable::Channel
    def subscribed
      stream_from "my_channel_#{current_user}"
    end

    def send_message(data)
      to = data['to']
      message = data['message']

      ActionCable.server.broadcast(
        "my_channel_#{to}",
        { sender: current_user, message: message }
      )
    end
  end
end
