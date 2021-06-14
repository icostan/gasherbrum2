require 'mountain_forecast'

namespace :gasherbrum2 do
  desc "Forecast..."
  task :forecast => :environment do
    puts 'Forecast from mountain-forecast.com...'
    provider = Provider.first
    data = MountainForecast.crawl provider
    puts "Saving ... #{data.size}"
    Forecast.create! data: data, elevation: provider.elevation
  end

  desc "Notifications..."
  task :notifications => :environment do
    puts 'Send forecast notification...'
    require 'forecast_mailer'
    forecast = Forecast.last
    puts "=+> Forecast data: (#{forecast.data.size}): #{forecast.data}"
    Notification.all.active.each do |n|
      puts "==> Sending #{n.format} notification to #{n.email} ..."
      ForecastMailer.with(forecast: forecast, notification: n).forecast_email.deliver_now
    end
  end

  desc 'Using Graph API'
  task :graphapi => :environment do
    puts 'Facebook Graph API...'
    require 'facebook'

    facebook = Facebook.new
    result = facebook.profile
    puts result
  end
end
