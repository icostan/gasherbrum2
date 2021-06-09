class ForecastMailer < ApplicationMailer
  def forecast_email
    @data = params[:data]
    mail(to: 'iulian.costan@gmail.com', from: 'iulian@costan.ro', subject: 'Gasherbrum2 forecast')
  end
end
