# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

config.log_level = :info
ActiveRecord::Base.colorize_logging = false

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false
# For recaptcha use
ENV['RECAPTCHA_PUBLIC_KEY']  = "6LeLLroSAAAAAA_Dk3t_7E4VCVYyIfuHmlCFW2-3"
ENV['RECAPTCHA_PRIVATE_KEY'] = "6LeLLroSAAAAAIehUO7rtf6VSMoLehk98rmnj18a"


# Include your application configuration below
YOURSITE = 'scheduler.rowbrunswick.org'
SUPPORTEMAIL = 'dpiltch@gmail.com'
ADMINEMAIL = 'dpiltch@gmail.com'

# Google Calendar and email items
EVENTCALENDAR = "http://www.google.com/calendar/embed?src=polarrowing%40gmail.com&ctz=America/New_York"
TIDECALENDAR = "http://www.google.com/calendar/embed?src=7k1mijisl3mjkdo8lu43sfo148%40group.calendar.google.com&ctz=America/New_York&color=%2328754E&mode=WEEK"
TIDECALENDARNAME = "Tides"


# RSS Items
BULLETINRSSTITLE = "Merrymeeting Community Rowing Bulletins"
BULLETINRSSDESC = "The latest bulletins and announcements from Merrymeeting Community Rowing."

# Configure the exception notifier
ExceptionNotification::Notifier.exception_recipients = %w(dpiltch@gmail.com)
ExceptionNotification::Notifier.sender_address = %("Scheduler Error" <mcra.brunswick@gmail.com>)
ExceptionNotification::Notifier.email_prefix = "[Rowbrunswick Scheduler ERROR] "
