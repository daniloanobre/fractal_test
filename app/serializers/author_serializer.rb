# frozen_string_literal: true

class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :writing_style
end
