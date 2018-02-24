# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name Faker::Name.name
    email { Faker::Internet.email }
    writing_style Author.writing_styles.symbolize_keys.keys.sample

    library_agreement_attributes { attributes_for(:library_agreement) }
  end

  trait :drama do
    writing_style :drama
  end

  trait :action do
    writing_style :action
  end

  trait :comedy do
    writing_style :comedy
  end

  trait :horror do
    writing_style :horror
  end

  trait :adventure do
    writing_style :adventure
  end
end
