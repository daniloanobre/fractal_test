# frozen_string_literal: true

class LibraryAgreement < ApplicationRecord
  belongs_to :author

  validates :starting_date, presence: true
  validates :duration, presence: true, format: { with: /\A\d+\z/, message: "Only integer is allowed." }
end
