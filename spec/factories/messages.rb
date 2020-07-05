# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    from { '+18008675309' }
    body { 'signup' }
  end
end
