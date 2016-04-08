class WebhooksController < ApplicationController
  def answer
    r = Plivo::Response.new()

    # r.addSpeak("I will wait for 3 seconds")
    # r.addWait({length: 3}) # Time to wait in seconds
    # r.addSpeak("I just waited 3 seconds")

    department_target = CompanyNumber.find_by(sip_endpoint: params[:To])

    if department_target
      user_ids  = department_target.users.pluck(:id)
      numbers   = UserNumber.where(user: user_ids).pluck(:sip_endpoint)

      if numbers.any?
        r.Dial({
          callerId: params[:From],
          # callbackUrl: 'http://26e71c18.ngrok.io/webhooks/',
          # action: '/ACTION_URL',
          timeout: 15
        }) do |dial|
          numbers.each do |number|
            dial.User number
          end
        end

        params = {
          'action' => "http://26e71c18.ngrok.io/webhooks/voicemail",
          'method' => 'GET',
          'maxLength' => '30',
        }
        r.addSpeak("Leave your message after the tone")
        r.addRecord(params)
      else
        r.addHangup({'reason' =>'NOBODY_TO_PICKUP'})
      end
    else
      r.addHangup({'reason' =>'INVALID_SERVICE'})
    end

    render xml: r.to_s()
  end

  def voicemail
    call = Call.find_or_initialize_by(uuid: params[:CallUUID])
    call.voicemail_url = params[:RecordFile]
    call.save!

    render nothing: true
  end

  def fallback
    puts "Got into fallack"
    p params

    render nothing: true
  end

  def hangup
    call = Call.find_or_initialize_by(uuid: params[:CallUUID])
    call.data = params
    call.save!

    render nothing: true
  end
end
