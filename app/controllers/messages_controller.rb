class MessagesController < ApplicationController


  def create

    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    @message.save
    redirect_to room_path(@room)

  end


  
  def destroy

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:room_id, :user_id, :message)
    end

end
