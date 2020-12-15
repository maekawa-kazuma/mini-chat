class Message < ApplicationRecord
  validates :content, presence: true
    # createの後(データ作成後）にコミット { MessageBroadcastJobのperformを遅延実行 引数はself }
    after_create_commit { MessageBroadcastJob.perform_later self }

  belongs_to :user
  belongs_to :room
end
