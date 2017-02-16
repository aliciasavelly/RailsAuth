class AddUserIdToCats < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, null: false
    add_index :cats, :user_id
  end
end
