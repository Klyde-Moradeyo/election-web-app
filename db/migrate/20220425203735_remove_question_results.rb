class RemoveQuestionResults < ActiveRecord::Migration[7.0]
  def change
    drop_table :question_results
  end
end
