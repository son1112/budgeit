# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversations::Command::Functions::Signup do
  subject { described_class }

  let(:arguments) { nil }
  let(:conversation) { create(:conversation) }
  let(:sms_client) { Sms::Client.new(conversation.user_number) }
  let(:message) { 'Hello! Would you like to create a Budgeit account?' }

  before do
    allow(Sms::Client).to receive(:new)
      .with(conversation.user_number)
      .and_return(sms_client)
    allow_any_instance_of(Sms::Client).to receive(:request)
      .with(message)
  end

  describe '.perform_using' do
    it 'instantiates an instance of the described_class' do
      expect(described_class).to receive(:new)
        .with(arguments, conversation)
        .and_return(described_class.new(arguments, conversation))

      subject.perform_using(arguments, conversation)
    end
    it 'instantiates an instance of the sms client' do
      expect(Sms::Client).to receive(:new)
        .with(conversation.user_number)
        .and_return(sms_client)

      subject.perform_using(arguments, conversation)
    end
    it 'makes a request to the client with the correct message' do
      expect(sms_client).to receive(:request)
        .with(message)

      subject.perform_using(arguments, conversation)
    end
  end
end
