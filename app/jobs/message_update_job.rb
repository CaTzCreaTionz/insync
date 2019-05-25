class MessageUpdateJob < ApplicationJob
  queue_as :default

  def perform(message, current_user)
    RoomChannel.broadcast_to(message.room_id, message: render_message(message, current_user))
  end

private

  def render_message(message, current_user)
    MessagesController.render(partial: 'messages/message', locals: {message: message})
  end
end
