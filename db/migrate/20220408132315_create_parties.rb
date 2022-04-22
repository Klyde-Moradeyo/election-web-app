class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.references :ballot, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
