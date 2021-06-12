require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_action :set_header

  skip_before_action :verify_authenticity_token

  def sms
    response = Twilio::TwiML::MessagingResponse.new do |r|
      r.message(body: 'Ahoy! Thanks so much for your message.')
    end
    render_twiml response
  end
end
