class RoomChannel < ApplicationCable::Channel

    # Consumer(WebSocketのクライアント)がChannelをsubscribe（受信）することでsubscriberとして振る舞う。

  def subscribed
    stream_from "room_channel_#{params['room']}"
    # Streamすることで、Channelにルーティング機能を与える。
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # jsで実行されたspeakのmessageを受け取り、room_channelのreceivedにブロードキャストする
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    Message.create! content: data['message'], user_id: current_user.id, room_id: params['room']
  end
end
