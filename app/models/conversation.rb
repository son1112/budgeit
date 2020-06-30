class Conversation < ApplicationRecord
  has_one :user
  has_many :messages
end
