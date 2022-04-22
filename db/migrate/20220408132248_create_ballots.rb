class CreateBallots < ActiveRecord::Migration[7.0]
  def change
    create_table :ballots do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.text :URL
      t.string :ballot_type
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :weighted_voting
      t.boolean :show_results

      t.timestamps
    end
  end
end
