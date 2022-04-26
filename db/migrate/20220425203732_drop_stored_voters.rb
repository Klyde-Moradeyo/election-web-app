class DropStoredVoters < ActiveRecord::Migration[7.0]
  def change
    drop_table :stored_voters
  end
end
