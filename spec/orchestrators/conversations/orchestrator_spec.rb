# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversations::Orchestrator do
  subject { described_class }

  let(:params) do
    {
     'From' => '+18008675309',
     'Body' => 'foobar'
    }
  end
  let(:conversation) { create(:conversation) }

  before do
    allow(Conversations::Command).to receive(:process)
      .with(params, conversation)
  end

  describe '.perform_using' do
    it 'instantiates a new orchestrator instance' do
      expect(subject).to receive(:new)
        .with(params, conversation)
        .and_return(subject.new(params, conversation))

      subject.perform_using(params, conversation)
    end

    it 'makes a call to process a command' do
      expect(Conversations::Command).to receive(:process)
        .with(params, conversation)

      subject.perform_using(params, conversation)
    end
  end
end
