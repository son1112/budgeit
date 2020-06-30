
module Conversations
  class Command
    module Mapper
      def self.command(command_item)
        {
          'signup': Conversations::Command::Functions::Signup
          # 'account': Conversations::Command::Functions::Account,
          # 'balance': Conversations::Command::Account::Functions::Balance,
          # 'credit': Conversations::Command::Account::Functions::Credit,
          # 'debit': Conversations::Command::Account::Functions::Debit
        }[command_item.to_sym]
      end
    end
  end
end
