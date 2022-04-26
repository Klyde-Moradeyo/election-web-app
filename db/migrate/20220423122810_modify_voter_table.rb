class ModifyVoterTable < ActiveRecord::Migration[7.0]
  def up
    remove_column :voters, :password, :string
    remove_column :voters, :email, :string
    remove_column :voters, :vote_weight, :integer
    remove_column :voters, :store_voter, :boolean 

    # change_column :voters, :username, :string, unique: true
    change_column :voters, :username, :string, null: false, unique: true
  end

  def down
    add_column :voters, :password, :string
    add_column :voters, :email, :string
    add_column :voters, :vote_weight, :integer
    add_column :voters, :store_voter, :boolean 

    change_column :voters, :username, :string, null: true, unique: false
  end
end

