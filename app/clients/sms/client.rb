# frozen_string_literal: true

module Sms
  class Client

    def initialize(user_number)
      @user_number = user_number
      @client = Twilio::REST::Client.new(account_sid, auth_token)
    end

    def request(message)
      @client.messages.create(
        request_params(message)
      )
    end

    private

    def request_params(message)
      {
        from: from_number,
        to: to_number,
        body: message
      }
    end

    def from_number
      Rails.application.secrets.twilio_from_number
    end

    def to_number
      @user_number
    end

    def account_sid
      Rails.application.secrets.twilio_account_sid
    end

    def auth_token
      Rails.application.secrets.twilio_auth_token
    end
  end
end
