class Call < ActiveRecord::Base
  store :data, accessors: [], coder: JSON
end
