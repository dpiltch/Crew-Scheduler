# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.18' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "fastercsv", :version => '>=1.4'
  config.gem 'mislav-will_paginate', :version => '~> 2.3.8', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'bluecloth'
  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Added for ActionMailer to work with Acts_as_authenticated
  config.active_record.observers = :user_observer, :event_observer

  config.time_zone = 'UTC'

  env_file = File.join(Rails.root, 'config', 'local_env.yml')
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end


# Include your application configuration below
SUPPORTEMAIL = 'dpiltch@gmail.com' unless defined? SUPPORTEMAIL
ADMINEMAIL = 'dpiltch@gmail.com' unless defined? ADMINEMAIL
YOURSITE = 'scheduler.rowbrunswick.org' unless defined? YOURSITE

# Google Calendar and email items
EVENTCALENDAR = "http://www.google.com/calendar/hosted/yarmouth-rowing.org/embed?src=scheduler%40yarmouth-rowing.org&ctz=America/New_York" unless defined? EVENTCALENDAR
TIDECALENDAR = "http://www.google.com/calendar/hosted/yarmouth-rowing.org/embed?src=yarmouth-rowing.org_0ingqags0ib0vuutvegtjckopg%40group.calendar.google.com&ctz=America/New_York&color=%2328754E&mode=WEEK" unless defined? TIDECALENDAR
TIDECALENDARNAME = "Tides" unless defined? TIDECALENDARNAME

# RSS Items
BULLETINRSSTITLE = "Yarmouth Rowing Club Bulletins" unless defined? BULLETINRSSTITLE
BULLETINRSSDESC = "The latest bulletins and announcements from Yarmouth Rowing Club." unless defined? BULLETINRSSDESC

# Configure the exception notifier
ExceptionNotification::Notifier.exception_recipients = %w(dpiltch@gmail.com)
ExceptionNotification::Notifier.sender_address = %("Scheduler Error" <merrymeeting.rowing@gmail.com>)
ExceptionNotification::Notifier.email_prefix = "[Rowbrunswick Scheduler ERROR] "

ActionMailer::Base.smtp_settings = {
 :user_name => ENV['GMAIL'],
 :password => ENV['GMAILPASSWD'],
 :authentication => :plain,
 :address  => "smtp.gmail.com",
 :port  => 587,
 :enable_starttls_auto => true,
 :domain  => 'gmail.com'
}

require 'fastercsv'

#daily notifications using rufus-scheduler gem
# require 'rufus/scheduler'
# scheduler = Rufus::Scheduler.start_new
#
# scheduler.schedule("0 15 * * *") do
#   Event.daily_notify
# end



