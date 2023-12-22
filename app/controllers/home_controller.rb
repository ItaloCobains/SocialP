class HomeController < ApplicationController
  def index
    (1..5).to_a.each do |_n|
      sleep 1
      SendEmailJob.perform_later
    end
    @message = 'Carregado'
  end
end
