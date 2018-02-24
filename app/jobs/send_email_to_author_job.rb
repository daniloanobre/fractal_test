# frozen_string_literal: true

class SendEmailToAuthorJob < ActiveJob::Base
  queue_as :emails

  rescue_from(Timeout::Error) do
    retry_job wait: 1.minutes, queue: :high_priority
  end

  def perform(author)
    @author = author
    ExampleMailer.sample_email(@author).deliver_later
  end
end
