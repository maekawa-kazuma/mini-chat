# csv形式を使えるようにするための記述
require 'csv'
namespace :import_csv do
  #タスクの説明
  desc "import_csv_about_profile_model"
  # タスク名
  task profiles: :environment do
    # インポートするファイルのパス取得
    path = "db/csv/csv_data.csv"
    # csvファイルからインポートしたデータを格納するための配列を用意
    list = []
    # 配列に格納するための記述
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row["name"],
        age: row["age"],
        address: row["address"]
    }
    end
    puts "インポート処理を開始"
    # インポートできなかった場合の例外処理
    begin
      Profile.create!(list)
      puts "インポート完了"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポート失敗:UnknownAttributeError"
    end
  end
end

