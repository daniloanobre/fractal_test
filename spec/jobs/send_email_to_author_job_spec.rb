# frozen_string_literal: true

require "rails_helper"

RSpec.describe SendEmailToAuthorJob, type: :job do
  include ActiveJob::TestHelper

  let(:author) { create(:author) }

  it "checking job class name" do
    expect { SendEmailToAuthorJob.perform_later }
      .to have_enqueued_job(SendEmailToAuthorJob)
  end

  it "checking job enqueued time" do
    expect { SendEmailToAuthorJob.perform_later }
      .to have_enqueued_job.on_queue("emails")
  end

  it "checking passed arguments to job" do
    expect { SendEmailToAuthorJob.perform_later(author) }
      .to have_enqueued_job.with(author)
  end

  it "executes perform" do
    ExampleMailer.sample_email(author).deliver_now
    perform_enqueued_jobs { SendEmailToAuthorJob.perform_later(author) }
  end

  it "handles no results error" do
    allow(ExampleMailer).to receive(:sample_email).and_raise(Timeout::Error)

    perform_enqueued_jobs do
      expect_any_instance_of(SendEmailToAuthorJob)
        .to receive(:retry_job).with(wait: 1.minutes, queue: :high_priority)

      SendEmailToAuthorJob.perform_later(author)
    end
  end
end
