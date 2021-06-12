require 'mountain_forecast'

namespace :gasherbrum2 do
  desc "Forecast..."
  task :forecast => :environment do
    puts 'Forecast from mountain-forecast.com...'
    data = MountainForecast.crawl
    puts "Saving ... #{data.size}"
    Forecast.create! data: data
  end

  desc "Notifications..."
  task :notifications => :environment do
    puts 'Send forecast notification...'
    require 'forecast_mailer'
    forecast = Forecast.last
    puts "=+> Forecast data: (#{forecast.data.size}): #{forecast.data}"
    Notification.all.active.each do |n|
      puts "==> Sending #{n.format} notification to #{n.email} ..."
      ForecastMailer.with(data: forecast.data, notification: n).forecast_email.deliver_now
    end
  end

  desc 'FB Graph API'
  task :graphapi => :environment do
    puts 'Facebook Graph API...'
    require 'koala'

    graph = Koala::Facebook::API.new ENV['ACCESS_TOKEN']
    # result = graph.get_object("me")
    result = graph.put_wall_post("hey, i'm learning graph api...")
    puts result
  end
end
