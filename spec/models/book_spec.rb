# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  it "should have a valid factory" do
   expect(build(:book)).to be_valid
 end

  describe "validations" do
    context "should require presence" do
      it { should validate_presence_of(:title) }
    end
  end

  describe "relationships" do
    it { should have_and_belong_to_many(:author) }
    it { should have_many(:chapters) }
  end
end
