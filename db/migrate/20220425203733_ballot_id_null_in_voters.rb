class BallotIdNullInVoters < ActiveRecord::Migration[7.0]
  def up
    change_column :voters, :ballot_id, :string, null: false
  end
  def down
    change_column :voters, :ballot_id, :string, null: true
  end
end
