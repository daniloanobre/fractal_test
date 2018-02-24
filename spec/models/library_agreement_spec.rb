# frozen_string_literal: true

require "rails_helper"

RSpec.describe LibraryAgreement, type: :model do
  it "should have a valid factory" do
    expect(build(:library_agreement)).to be_valid
  end

  describe "validations" do
     context "should require presence" do
       it { should validate_presence_of(:starting_date) }
       it { should validate_presence_of(:duration) }
     end
   end

  context "relationships" do
    it { should belong_to(:author) }
  end
end
