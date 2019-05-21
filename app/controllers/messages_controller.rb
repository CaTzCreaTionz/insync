class MessagesController < ApplicationController


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    @message.save

    respond_to do |format|
        if @message.save
          ActionCable.server.broadcast 'room_channel', message: @message
         format.html { redirect_to @room, notice: 'Message was created successfully.' }
       else
    end
  end
end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:room_id, :user_id, :message)
    end

end
