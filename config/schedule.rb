require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
rails_root = Rails.root.to_s
set :environment, rails_env

set :output, "#{Rails.root}/log/cron.log"

every :tuesday, at: ['3:49 pm'] do
  runner 'Comment.paa'
end

