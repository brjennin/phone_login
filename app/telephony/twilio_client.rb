require 'twilio-ruby'

class TwilioClient
  def self.send_sms(phone_number, message)
    @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    message = @client.messages.create(
      body: message,
      to: phone_number,
      from: ENV["TWILIO_SMS_FROM_NUMBER"])

    puts message.sid
  end
end
