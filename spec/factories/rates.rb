# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    rate { 54.2 }
    force_date { Time.now + 2.days }
  end
end
