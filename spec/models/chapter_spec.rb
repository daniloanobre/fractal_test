# frozen_string_literal: true

require "rails_helper"

RSpec.describe Chapter, type: :model do
  it "should have a valid factory" do
    expect(build(:chapter)).to be_valid
  end

  describe "validations" do
    context "should require presence" do
      it { should validate_presence_of(:title) }
      it { should validate_length_of(:content).is_at_most(500) }
    end
  end

  describe "relationships" do
    it { should belong_to(:book) }
  end
end
