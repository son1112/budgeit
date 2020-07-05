# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversations::Command::Builder do
  subject { described_class.build(params, conversation) }

  let(:params) do
    {
     'From' => '+18008675309',
     'Body' => "#{command} #{arguments}"
    }
  end
  let(:command) { 'signup' }
  let(:arguments) { nil }
  let(:conversation) { create(:conversation) }
  let!(:message) do
    conversation.messages.new(
      from: params['From'],
      body: params['Body']
    )
  end

  before do
    allow_any_instance_of(Message).to receive(:save).and_return(true)
  end

  describe '.build' do
    it 'instantiates an instance of the builder' do
      expect(described_class).to receive(:new)
        .with(params, conversation)
        .and_return(described_class.new(params, conversation))

      subject
    end

    it 'constructs a command/arguments hash' do
      expect(subject).to be_a(Hash)
    end

    context 'when signup' do
      it 'has the correct command class' do
        expect(subject[:command]).to eq(Conversations::Command::Functions::Signup)
      end

      it 'has the correct arguments' do
        expect(subject[:arguments]).to eql([])
      end
    end

    it 'maps a command from the params body' do
      expect(Conversations::Command::Mapper).to receive(:command)
        .with('signup')

      subject
    end

    it 'records a conversation message' do
      expect(conversation.messages).to receive(:new)
        .with(from: params['From'], body: params['Body'])
        .and_return(message)

      expect(message).to receive(:save)

      subject
    end
  end
end
