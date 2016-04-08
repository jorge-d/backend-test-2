class User < ActiveRecord::Base
  has_and_belongs_to_many :groups, join_table: :group_memberships
  has_many :numbers, class_name: 'UserNumber'
end
