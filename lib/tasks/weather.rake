require 'mountain_forecast'

namespace :weather do
  desc "Get weather forecasts..."
  task :forecast => :environment do
    require 'forecast_mailer'

    puts 'Weather forecasts ...'

    data = MountainForecast.crawl
    puts "Forecast (#{data.size}): #{data}"
    Notification.all.each do |n|
      puts "==> Notify #{n.email}..."
      ForecastMailer.with(data: data, email: n.email, format: n.format).forecast_email.deliver_now
    end
  end
end
