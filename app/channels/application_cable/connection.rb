module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      puts request.params[:user]
      self.current_user = request.params[:user]
    end
  end
end
