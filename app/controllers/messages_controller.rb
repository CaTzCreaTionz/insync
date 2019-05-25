class MessagesController < ApplicationController


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    @user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @room, notice: 'Message was created successfully.' }
        format.json { render :show, status: :created, location: @room }
        format.js
       else
        format.html { redirect_to @room, alert: 'Review was not saved successfully.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end
end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:room_id, :user_id, :message)
    end

end
