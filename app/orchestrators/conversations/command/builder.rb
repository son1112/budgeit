# frozen_string_literal: true

module Conversations
  class Command
    class Builder
      def self.build(params, conversation)
        new(params, conversation).build
      end

      def initialize(params, conversation)
        @params = params
        @conversation = conversation
        record_message
      end

      def build
        {
          command: command,
          arguments: arguments
        }
      end

      private

      def command
        Conversations::Command::Mapper.command(
          command_items.first
        )
      end

      def arguments
        command_items[1..-1]
      end

      def command_items
        body.split(' ')
      end

      def body
        @params["Body"]
      end

      def user_number
        @params["From"]
      end

      def record_message
        @conversation.messages.new(from: user_number, body: body).save
      end
    end
  end
end
