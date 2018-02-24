# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.integer :writing_style

      t.timestamps
    end
  end
end
