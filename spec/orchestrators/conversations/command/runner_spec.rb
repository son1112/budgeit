# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversations::Command::Runner do
  subject { described_class }

  let(:command) do
    {
      command: Conversations::Command::Mapper.command(command_text),
      arguments: arguments
    }
  end
  let(:command_text) { 'signup' }
  let(:arguments) { nil }
  let(:conversation) { create(:conversation) }

  before do
    allow_any_instance_of(Sms::Client).to receive(:request)
      .and_return(true)
  end

  describe '#perform_using' do
    it 'instantiates an instance of the described class' do
      expect(described_class).to receive(:new)
        .with(command, conversation)
        .and_return(described_class.new(command, conversation))

      subject.perform_using(command, conversation)
    end
    context 'signup' do
      it 'makes a call to perform the given command' do
        expect(Conversations::Command::Functions::Signup).to receive(:perform_using)
          .with(arguments, conversation)

        subject.perform_using(command, conversation)
      end
    end
  end
end
