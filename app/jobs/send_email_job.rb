class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    sleep 10
    puts 'Sending email...'
    sleep 10
    puts 'Email sent!'
  end
end
