# frozen_string_literal: true

FactoryBot.define do
  factory :word do
    word { Faker::Alphanumeric.alpha(number: 5) }
  end
end
