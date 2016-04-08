class CreateGroupMemberships < ActiveRecord::Migration
  def change
    add_column :company_numbers, :name, :string, null: false, default: ''

    create_table :group_memberships do |t|
      t.integer :user_id
      t.integer :company_number_id
    end

    add_index :group_memberships, [:user_id, :company_number_id], unique: true
  end
end
