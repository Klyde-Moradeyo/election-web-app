class voterResultRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :voter_result_ranks do |t|
      t.references :question_result, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      t.integer :rank
      t.timestamps
    end
  end
end
