class RemoveQuestionResults < ActiveRecord::Migration[7.0]
  def change
    drop_table :ballot_results
  end
end
