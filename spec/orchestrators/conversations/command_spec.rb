# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversations::Command do
  subject { described_class }

  let(:params) do
    {
     'From' => '+18008675309',
     'Body' => 'foobar'
    }
  end
  let(:conversation) { create(:conversation) }

  before do
    allow(Conversations::Command::Runner).to receive(:perform_using)
  end

  describe '.process' do
    it 'instantiates a new command instance' do
      expect(subject).to receive(:new)
        .with(params, conversation)
        .and_return(subject.new(params, conversation))

      subject.process(params, conversation)
    end

    it 'builds a command to be run' do
      expect(Conversations::Command::Builder).to receive(:build)
        .with(params, conversation)

      subject.process(params, conversation)
    end

    it 'calls the command runner' do
      expect(Conversations::Command::Runner).to receive(:perform_using)
        .with(anything, conversation)

      subject.process(params, conversation)
    end
  end

  describe '#run'
end
