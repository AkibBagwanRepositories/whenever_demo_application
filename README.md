# Whenever Demo Application

> This document is created by [reference](https://github.com/javan/whenever).

* Install whenever gem
```ruby 
gem install whenever
```

or add  for bundler (in Gemfile)
```ruby
gem 'whenever', require: false
```
* go inside your project 
```ruby
cd /my-project
```
and now create `schedule.rb` that will help us to create jobs.(location `config/schedule.rb` )
```ruby
bundle exec wheneverize .
```
* now open the `config/schedule.rb` file you will see some demo/ reference code 
comment it and write following code in it.
```ruby
set :environment, "development"
set :output, "#{Whenever.path}/log/whenever.log"
set :job_template, nil

# This will execute on after each 1 minute
every 1.minute do
    command "echo 'here you can use raw cron syntax too'"
end

# You also can use following:
# 1.minute 1.day 1.week 1.month 1.year is also supported 
```
* now update the scheduler
```ruby
whenever --update-crontab
```


> Now run the server

* start server
```ruby
rails s
```
* open file `my-project/log/whenever.log` you can see on each minute our command will execute and print the log in `whenever.log`.
* You also can run following by whenever:
	
	* `runner` : will help to run rails functions
    
	* `command` : will help to run rails commands 
	
	* `rake` : also can help to run rake commands

> Example:
```ruby
every 3.hours do # 1.minute 1.day 1.week 1.month 1.year is also supported
  runner "MyModel.some_process"
  rake "my:rake:task"
  command "/usr/bin/my_great_command"
end
```

