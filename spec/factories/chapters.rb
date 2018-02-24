# frozen_string_literal: true

FactoryBot.define do
  factory :chapter do
    title Faker::Book.title
    content Faker::Lorem.paragraph

    book
  end
end
