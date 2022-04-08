class CreateBallotResults < ActiveRecord::Migration[7.0]
  def change
    create_table :ballot_results do |t|
      t.references :ballot, null: false, foreign_key: true
      t.references :question_result, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
