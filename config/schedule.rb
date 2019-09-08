set :environment, "development"
set :output, "cron_log.log"
# Use this file to easily define all of your cron jobs.
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# 1.minute 1.day 1.week 1.month 1.year is also supported
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
#whenever --update-crontab bbtangcms #appname
=begin
The default job types that ship with Whenever are defined like so:
job_type :command, ":task :output"
job_type :rake,    "cd :path && RAILS_ENV=:environment bundle exec rake :task --silent :output"
job_type :runner,  "cd :path && script/rails runner -e :environment ':task' :output"
job_type :script,  "cd :path && RAILS_ENV=:environment bundle exec script/:task :output"
=end
#whenever -i  config/schedule.rb -s environment=development --update-crontab bbtangcms

set :output, "#{Whenever.path}/log/whenever.log"
set :job_template, nil
#set :output, File.join(Whenever.path, "log", "whenever.log")

every 3.weeks do
  rake "bbtangcms:page_request:clean_older"
end

every 1.day do
  #command "echo 'today whenever running ..'"
  runner "puts '#{Date.today} whenever running ...'"
end

every 10.minutes do
  #command "echo 'today whenever running ..'"
   rake "bbtangcms:notify:new_question_notify"
end

every '0 0 27-31 * *' do
    command "echo 'you can use raw cron syntax too'"
end

every 1.minute do
    command "echo 'here you can use raw cron syntax too'"
end

every 1.minute do
    command "echo 'second you can use raw cron syntax too'"
end

every 1.day, :at => '3:00 am' do
  rake "assets:precompile"
  command "touch #{Whenever.path}/tmp/restart.txt"
end

# every 4.second do
#     command "echo 'you can use raw cron syntax too'"
# end

# Learn more: http://github.com/javan/whenever
