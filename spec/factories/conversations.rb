# frozen_string_literal: true

FactoryBot.define do
  factory :conversation do
    user_number { '+18008675309' }
    service_number { '+15555555555' }
  end
end
