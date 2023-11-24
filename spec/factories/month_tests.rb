# frozen_string_literal: true

FactoryBot.define do
  factory :month_test do
    month { 'june' }
    returned_value { 6 }
  end
end
