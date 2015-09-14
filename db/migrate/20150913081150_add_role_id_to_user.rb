class AddRoleIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :role, index: true, foreign_key: true, null: false
  end
end
