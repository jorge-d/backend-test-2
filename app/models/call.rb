class Call < ActiveRecord::Base
  store :data, accessors: [:CallStatus, :From, :To, :Duration, :StartTime], coder: JSON

  belongs_to :user

  validates_presence_of :uuid
end
