class CreateQuestionResults < ActiveRecord::Migration[7.0]
  def change
    create_table :question_results do |t|
      t.references :question, null: false, foreign_key: true
      t.references :ballot, null: false, foreign_key: true
      t.references :voter, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
