# 名前空間（タスクをグループ分けする役割を担う
namespace :task_sample do
#タスクの説明(description ▷ desc)
  desc "実行処理の説明"
#タスク名(:sample)
  task :sample do
#タスク内容
    puts "Hello World"
  end

  desc "task_sample_use_user_model"
  task :task_model => :environment do
    puts User.first().to_yaml
  end
end

