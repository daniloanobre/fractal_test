# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :author
  has_many :chapters

  validates :title, presence: true
end
