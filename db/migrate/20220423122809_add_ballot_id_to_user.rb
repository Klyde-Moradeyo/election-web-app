class AddBallotIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :ballots, :password, :bigint
  end
end

