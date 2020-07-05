# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sms::Client do
  subject { described_class }

  let(:message) { 'foobar' }
  let(:user_number) { '+18008675309' }
  let(:request_params) do
    {
      from: nil,
      to: user_number,
      body: message
    }
  end
  let(:mock_twilio_client_messages) do
    double(
      'Messages'
    )
  end
  let(:mock_twilio_client) do
    double(
      'Twilio::REST::Client',
      messages: mock_twilio_client_messages
    )
  end

  before do
    allow(Twilio::REST::Client).to receive(:new)
      .and_return(mock_twilio_client)
    allow(mock_twilio_client_messages).to receive(:create)
      .with(request_params)
  end

  context 'when initialized' do
    it 'creates a Twilio client' do
      expect(Twilio::REST::Client).to receive(:new)

      subject.new(user_number)
    end
  end

  describe '#request' do
    let(:sms_client) { subject.new(user_number) }

    it 'creates a twilio message' do
      expect(mock_twilio_client).to receive(:messages)
      expect(mock_twilio_client_messages).to receive(:create)
        .with(request_params)

      sms_client.request(message)
    end
  end
end
