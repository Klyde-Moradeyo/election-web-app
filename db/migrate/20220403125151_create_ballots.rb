class CreateBallots < ActiveRecord::Migration[7.0]
  def change
    create_table :ballots do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.text :URL
      t.string :ballot_type
      t.datetime :record_updated_at

      t.timestamps
    end
  end
end
