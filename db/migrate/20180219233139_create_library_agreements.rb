# frozen_string_literal: true

class CreateLibraryAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :library_agreements do |t|
      t.string :starting_date
      t.integer :duration
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
