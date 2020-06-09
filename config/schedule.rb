require File.expand_path(File.dirname(__FILE__) + "/environment")
#rails_env = ENV['RAILS_ENV'] || :development
rails_env = :development
rails_root = Rails.root.to_s
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"
env :PATH, ENV['PATH']

#↓こうするとうまく動くけど色々cronに登録された、、、うまい具合にしておかねば
#ENV.each { |k, v| env(k, v) }

DIR_RBENV_BIN = "#{ENV['HOME']}/.rbenv/bin"
job_type :rbenv_rake, %Q!PATH="#{DIR_RBENV_BIN}:$PATH"; eval "$(rbenv init -)"; cd :path && :bundle_command rake :task --silent :output!
job_type :be_rake, 'cd :path && :bundle_command rake :task --silent :output'
job_type :rake,    "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

#正常に動くか調査のため毎日回してます
every 1.days, at:"0:00 am" do
  rake "comic_board:new_task"
end


