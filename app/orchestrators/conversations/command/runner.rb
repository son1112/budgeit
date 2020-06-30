# frozen_string_literal: true

module Conversations
  class Command
    class Runner

      def self.perform_using(command, conversation)
        new(command, conversation).process_command
      end

      def initialize(command, conversation)
        @command = command
        @conversation = conversation
      end

      def process_command
        command.perform_using(arguments, @conversation)
      end

      def command
        @command[:command]
      end

      def arguments
        @command[:arguments]
      end
    end
  end
end
