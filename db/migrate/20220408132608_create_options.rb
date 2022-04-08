class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :question, null: false, foreign_key: true
      t.references :ballot, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
