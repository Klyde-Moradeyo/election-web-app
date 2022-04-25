class DropPermissions < ActiveRecord::Migration[7.0]
  def change
    drop_table :permissions
  end
end
