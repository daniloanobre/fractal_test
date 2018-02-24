# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :book

  validates :title, presence: true
  validates :content, allow_blank: true, length: { maximum: 500 }
end
