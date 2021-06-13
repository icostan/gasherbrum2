class TwilioControllerTest < ActionDispatch::IntegrationTest
  test "the incomming message" do
    params = {"ToCountry"=>"US", "ToState"=>"UT", "SmsMessageSid"=>"SM29e37cfd582a2cd7fb42808cd5b0012a", "NumMedia"=>"0", "ToCity"=>"SALT LAKE CITY", "FromZip"=>"", "SmsSid"=>"SM29e37cfd582a2cd7fb42808cd5b0012a", "FromState"=>"", "SmsStatus"=>"received", "FromCity"=>"", "Body"=>"Hello Gasherbrum2!", "FromCountry"=>"RO", "To"=>"+13853931460", "ToZip"=>"", "NumSegments"=>"1", "MessageSid"=>"SM29e37cfd582a2cd7fb42808cd5b0012a", "AccountSid"=>"AC1d866347367c2f1f43baa7797390bda2", "From"=>"+40770491538", "ApiVersion"=>"2010-04-01"}
    assert_difference 'Message.count', 1 do
      post twilio_sms_path params
    end
    assert_response :success
  end
end
