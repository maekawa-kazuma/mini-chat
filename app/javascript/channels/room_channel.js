import consumer from "./consumer"

$(function() {
  const chatChannel = consumer.subscriptions.create({channel: "RoomChannel", room: $('#message').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    // データ受信。room_channel.rbでブロードキャストされたものが届く
    received: function(data) {
      return $('#message').append(data['message']);
      // Called when there's incoming data on the websocket for this channel
    },
    // これが実行されるとコンシューマ(WebSocket Connectionのクライアント))になったRoomChannel#speak({ message: message })が呼ばれる
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });
  
  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    //keycodeが13(すなわちEnterキー)を押された時の条件分岐
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});




