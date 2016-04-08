class Call < ActiveRecord::Base
  store :data, accessors: [:From, :To, :Duration], coder: JSON

  validates_presence_of :uuid
end
