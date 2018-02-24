# frozen_string_literal: true

require "rails_helper"

RSpec.describe ExampleMailer, type: :mailer do
  describe "instructions" do
    let(:author) { create(:author) }
    let(:mail) { ExampleMailer.sample_email(author).deliver_now }

    it "checking send email to author" do
      expect { mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "renders the subject" do
      expect(mail.subject).to eq("Sample Email")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([author.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq(["from@example.com"])
    end

    it "assigns @email" do
      expect(mail.body.encoded).to match(author.email)
    end
  end
end
