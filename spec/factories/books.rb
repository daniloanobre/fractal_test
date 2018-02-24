# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title Faker::Book.title
    year Faker::Date.birthday(1, 99).year
  end
end
