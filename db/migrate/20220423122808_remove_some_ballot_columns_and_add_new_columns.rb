class RemoveSomeBallotColumnsAndAddNewColumns < ActiveRecord::Migration[7.0]
  def up
    remove_column :ballots, :ballot_type, :string
    remove_column :ballots, :weighted_voting, :string
    remove_column :ballots, :show_results, :boolean
    remove_column :ballots, :URL, :boolean
    
    add_column :ballots, :show_voter_results, :boolean
    add_column :ballots, :access_token, :bigint, unique: true
    change_column :ballots, :access_token, :bigint, null: false
  end

  def down
    add_column :ballots, :ballot_type, :string
    add_column :ballots, :weighted_voting, :string
    add_column :ballots, :show_results, :boolean
    add_column :ballots, :URL, :boolean
    
    remove_column :ballots, :show_voter_results, :boolean
    remove_column :ballots, :access_token, :bigint, unique: true
  end
end
