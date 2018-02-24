# frozen_string_literal: true

FactoryBot.define do
  factory :library_agreement do
    starting_date Faker::Date.birthday(1, 99)
    duration Faker::Date.birthday(1, 5).year

    author
  end
end
