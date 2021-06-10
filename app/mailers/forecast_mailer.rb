class ForecastMailer < ApplicationMailer
  def forecast_email
    @data = params[:data]
    notification = params[:notification]
    options = { to: notification.email, subject: notification.subject }
    if notification.format.blank?
      mail(options) do |format|
        format.html
        format.text
      end
    else
      mail(options) do |format|
        m = format.method notification.format
        m.call
      end
    end
  end
end
