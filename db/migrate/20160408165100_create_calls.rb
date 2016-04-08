class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.text :data
      t.timestamps null: false
    end
  end
end

# {"TotalCost"=>"0.00300",
#  "EndTime"=>"2016-04-08 17:38:20",
#  "Direction"=>"inbound",
#  "HangupCause"=>"NORMAL_CLEARING",
#  "From"=>"sip:caller160408140203@phone.plivo.com",
#  "CallerName"=>"Caller",
#  "BillDuration"=>"60",
#  "BillRate"=>"0.00300",
#  "To"=>"sip:sales160408161440@phone.plivo.com",
#  "AnswerTime"=>"2016-04-08 17:38:12",
#  "StartTime"=>"2016-04-08 17:38:11",
#  "Duration"=>"9",
#  "CallUUID"=>"70ec418c-8c80-4c14-ba81-97db81914b11",
#  "SIP-H-To"=>"<sip:sales160408161440@phone.plivo.com>",
#  "CallStatus"=>"completed",
#  "Event"=>"Hangup",
#  "controller"=>"webhooks",
#  "action"=>"hangup"}
