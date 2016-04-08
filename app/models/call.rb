class Call < ActiveRecord::Base
  store :data, accessors: [:From, :To, :Duration], coder: JSON

  belongs_to :user

  validates_presence_of :uuid
end
