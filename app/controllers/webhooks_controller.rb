class WebhooksController < ApplicationController
  include Plivo

  def answer
    r = Response.new()

    r.addSpeak("I will wait for 3 seconds")
    r.addWait({length: 3}) # Time to wait in seconds
    r.addSpeak("I just waited 3 seconds")

    render xml: r.to_s()
  end

  def fallback
  end

  def hangup
    # binding.pry

    puts params

    render nothing: true
  end
end
