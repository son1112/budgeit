# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversations::Command::Mapper do
  subject { Conversations::Command::Mapper }

  describe '.command' do
    context 'with command_item signup' do
      it 'returns the signup function class' do
        expect(subject.command('signup')).to eql(
          Conversations::Command::Functions::Signup
        )
      end
    end
    context 'with account'
    context 'with balance'
    context 'with credit'
    context 'with debit'
    context 'with report'
  end
end
