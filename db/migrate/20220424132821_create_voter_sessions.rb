class CreateVoterSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :voter_sessions do |t|

      t.timestamps
    end
  end
end
