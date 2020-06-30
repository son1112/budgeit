# frozen_string_literal: true

module Conversations
  class Orchestrator
    def self.perform_using(params, conversation)
      new(params, conversation).process
    end

    def initialize(params, conversation)
      @params = params
      @conversation = conversation
    end

    def process
      Conversations::Command.process(@params, @conversation)
    end
  end
end
