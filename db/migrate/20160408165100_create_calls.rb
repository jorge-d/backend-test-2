class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.text :data
      t.timestamps null: false
    end
  end
end
