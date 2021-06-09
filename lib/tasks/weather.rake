require 'mountain_forecast'

namespace :weather do
  desc "Get weather forecasts..."
  task :forecast => :environment do
    puts 'Weather forecasts ...'

    require 'forecast_mailer'

    data = MountainForecast.crawl
    puts "Forecast (#{data.size}): #{data}"
    ForecastMailer.with(data: data).forecast_email.deliver_now
  end
end
