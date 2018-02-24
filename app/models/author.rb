# frozen_string_literal: true

class Author < ApplicationRecord
  has_and_belongs_to_many :books
  has_one :library_agreement, dependent: :destroy

  enum writing_style: { drama: 0, action: 1, comedy: 2, horror: 3, crime: 4, adventure: 5 }
  accepts_nested_attributes_for :library_agreement

  include Constants

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL }
  validates :writing_style, presence: true
end
