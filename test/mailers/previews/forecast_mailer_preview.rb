require 'mountain_forecast'

# Preview all emails at http://localhost:3000/rails/mailers/forecast_mailer
class ForecastMailerPreview < ActionMailer::Preview
  def forecast
    data = MountainForecast.crawl
    ForecastMailer.with(data: data).forecast_email
  end
end
