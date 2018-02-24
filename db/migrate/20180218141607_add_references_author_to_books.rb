# frozen_string_literal: true

class AddReferencesAuthorToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :author, references: :authors, index: true
  end
end
