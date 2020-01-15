# frozen_string_literal: true

set :environment, 'development'
set :output, error: 'log/cron_error_log.log', standard: 'log/cron_log.log'
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

every 1.minute do
  runner 'CreateRateFromScrapService.call'
end
