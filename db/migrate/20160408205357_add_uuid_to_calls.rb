class AddUuidToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :uuid, :string, null: false, default: ''

    add_index :calls, :uuid, :unique => true
  end
end
