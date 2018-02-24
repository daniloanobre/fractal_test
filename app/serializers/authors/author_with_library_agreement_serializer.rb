# frozen_string_literal: true

class Authors::AuthorWithLibraryAgreementSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :writing_style
  has_one :library_agreement

  has_many :books
end
