class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { MessageUpdateJob.perform_later(self, self.user) }

end

def create
  @room = Room.find(params[:room_id])
  @message = @room.messages.new(message_params)
  @message.user = current_user

  respond_to do |format|
    if @message.save
      format.html { redirect_to @room, notice: 'Review was created successfully.' }
      format.json { render :show, status: :created, location: @room }
    else
      format.html { redirect_to @room, alert: 'Review was not saved successfully.' }
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end
end
