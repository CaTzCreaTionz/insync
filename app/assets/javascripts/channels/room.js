App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
  // Called when there's incoming data on the websocket for this channel
  $('.chat-main').append(data.message);
  resetForm();
  scrollBottom();
  },

  listen_to_messages: function() {
    // Called when there's incoming data from a specific room channel
    return this.perform('listen', {
      room_id: $("[data-room-id]").data("room-id")
    });
  }
});

$(document).on('turbolinks:load', function() {
  App.room.listen_to_messages();
  scrollBottom();
});

function resetForm() {
  $('input[type="text"]').val('');
}

function scrollBottom() {
  $('.chat-main').scrollTop($('.chat-main')[0].scrollHeight);
}
