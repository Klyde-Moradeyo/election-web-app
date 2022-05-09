class AddFieldsInBallot < ActiveRecord::Migration[7.0]
  def change
    add_column :ballots, :expected_voters, :integer
    add_column :ballots, :voting_type, :string
  end
end
