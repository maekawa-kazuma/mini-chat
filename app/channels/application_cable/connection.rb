module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      reject_unauthorized_connection unless find_verified_user
    end

    private

    def find_verified_user
      self.current_user = env['warden'].user
    # env['warden'].userでログイン中のユーザのインスタンスにアクセス
    end
  end
end

# connectionは、、クライアントとサーバー間の関係を成立させる基礎となる。connectionのオブジェクトは、サーバーでWebSocketを受け付けるたびに、インスタンス化する。なおこのオブジェクトは、今後作成される全てのチャネルサブスクライバの親となる。railsガイド参照