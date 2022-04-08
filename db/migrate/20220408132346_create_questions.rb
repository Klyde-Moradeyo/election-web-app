class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :ballot, null: false, foreign_key: true
      t.string :question_type
      t.string :title
      t.text :description
      t.boolean :randomize_selection
      t.boolean :voter_abstain

      t.timestamps
    end
  end
end
