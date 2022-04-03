class CreateQuestionResults < ActiveRecord::Migration[7.0]
  def change
    create_table :question_results do |t|
      t.references :question, null: false, foreign_key: true
      t.references :ballot, null: false, foreign_key: true
      t.text :content
      t.datetime :record_updated_at

      t.timestamps
    end
  end
end
