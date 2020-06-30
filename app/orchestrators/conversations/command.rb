# frozen_string_literal: true

module Conversations
  class Command
    def self.process(params, conversation)
      new(params, conversation).run
    end

    def initialize(params, conversation)
      @params = params
      @conversation = conversation
    end

    def run
      Conversations::Command::Runner.perform_using(command, @conversation)
    end

    def command
      Conversations::Command::Builder.build(@params, @conversation)
    end
  end
end
