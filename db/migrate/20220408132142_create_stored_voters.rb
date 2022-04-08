class CreateStoredVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :stored_voters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.string :password
      t.string :email
      t.integer :vote_weight

      t.timestamps
    end
  end
end
