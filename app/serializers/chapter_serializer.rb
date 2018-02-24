# frozen_string_literal: true

class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
end
