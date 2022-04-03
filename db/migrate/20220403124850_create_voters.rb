class CreateVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :voters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.string :password
      t.integer :vote_weight
      t.datetime :record_updated_at
      t.boolean :store_voter

      t.timestamps
    end
  end
end
