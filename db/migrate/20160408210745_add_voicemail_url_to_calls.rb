class AddVoicemailUrlToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :voicemail_url, :string
  end
end
