# frozen_string_literal: true

module Conversations
  class Command
    module Functions
      class Signup
        def self.perform_using(arguments, conversation)
          new(arguments, conversation).process
        end

        def initialize(arguments, conversation)
          @arguments = arguments
          @conversation = conversation
          @client = Sms::Client.new(@conversation.user_number)
        end

        def process
          # - RESPOND :: 'Hello! Would you like to create a Budgeit account?'
          @client.request(message)
          # create 
          # create USER
          ## 
        end

        private

        def message
          'Hello! Would you like to create a Budgeit account?'
        end
      end
    end
  end
end
