class AddSeatsToBallot < ActiveRecord::Migration[7.0]
  def change
    add_column :ballots, :seats, :integer
  end
end