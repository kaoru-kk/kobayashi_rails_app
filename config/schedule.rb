require File.expand_path(File.dirname(__FILE__) + "/environment")
#rails_env = ENV['RAILS_ENV'] || :development
rails_env = :development
rails_root = Rails.root.to_s
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"
env :PATH, ENV['PATH']

env "DB_USER", ENV['DB_USER']
env "DB_PASSWORD", ENV['DB_PASSWORD']

DIR_RBENV_BIN = "#{ENV['HOME']}/.rbenv/bin"
job_type :rbenv_rake, %Q!PATH="#{DIR_RBENV_BIN}:$PATH"; eval "$(rbenv init -)"; cd :path && :bundle_command rake :task --silent :output!
job_type :rake,    "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

every :monday, :at => "00:00am" do
  rake "comic_board:new_task"
end

#月が祝日の週の土曜日に定時処理を設定
dates = ComicBoardsHelper.saturday_release_dates
dates.each do |d|
  every "0 0 #{d.day} #{d.month} 6" do
    rake "comic_board:new_task"
  end
end

#bundle exec whenever --clear-crontab && bundle exec whenever --update-crontab