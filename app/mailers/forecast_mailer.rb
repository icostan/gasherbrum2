class ForecastMailer < ApplicationMailer
  def forecast_email
    @data = params[:data]
    email = params[:email]
    format = "text/#{params[:format] || 'html'}"
    mail(to: email, subject: 'Gasherbrum2 forecast')
  end
end
