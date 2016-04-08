class WebhooksController < ApplicationController
  def answer
    r = Plivo::Response.new()
    department_target = CompanyNumber.find_by(sip_endpoint: params[:To])

    if department_target
      user_ids  = department_target.users.pluck(:id)
      numbers   = UserNumber.where(user: user_ids).pluck(:sip_endpoint)

      if numbers.any?
        r.Dial({
          callerId: params[:From],
          callbackUrl: "http://#{request.host}/webhooks/after_dial",
          callbackMethod: 'GET',
          action: "http://#{request.host}/webhooks/action",
          method: 'GET',
          timeout: 15
        }) do |dial|
          numbers.each do |number|
            dial.User number
          end
        end
      else
        r.addSpeak("There is no-one working here !")
        r.addHangup({'reason' => 'BANKRUPT'})
      end
    else
      r.addHangup({'reason' => 'INVALID_SERVICE'})
    end

    render xml: r.to_s()
  end

  def voicemail
    call = Call.find_or_initialize_by(uuid: params[:CallUUID])
    call.voicemail_url = params[:RecordFile]
    call.save!

    render nothing: true
  end

  def after_dial
    if params[:DialAction] == 'answer'
      call = Call.find_or_initialize_by(uuid: params[:CallUUID])
      call.user = UserNumber.find_by(sip_endpoint: params[:DialBLegTo]).user
      call.save!
    end

    render nothing: true
  end

  def action
    r = Plivo::Response.new()

    if params[:DialStatus] == 'no-answer'
      voicemailParams = {
        'action' => "http://#{request.host}/webhooks/voicemail",
        'method' => 'GET',
        'maxLength' => '30',
      }

      r.addSpeak("Leave your message after the tone")
      r.addRecord(voicemailParams)
    end

    render xml: r.to_s()
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
