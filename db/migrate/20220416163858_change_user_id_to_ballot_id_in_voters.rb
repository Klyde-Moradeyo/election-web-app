class ChangeUserIdToBallotIdInVoters < ActiveRecord::Migration[7.0]
  def change
    remove_reference :voters, :user, null: false
    add_reference :voters, :ballot, index: true
  end
end
