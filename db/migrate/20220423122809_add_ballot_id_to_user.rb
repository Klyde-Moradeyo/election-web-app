class AddBallotIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ballot_id, :bigint
  end
end

