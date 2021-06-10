require 'mountain_forecast'

# Preview all emails at http://localhost:3000/rails/mailers/forecast_mailer
class ForecastMailerPreview < ActionMailer::Preview
  def forecast
    notification = Notification.new
    forecast = Forecast.last
    ForecastMailer.with(data: forecast.data, notification: notification).forecast_email
  end
end
