class AddFieldsInVoter < ActiveRecord::Migration[7.0]
  def change
    add_column :voters, :email, :string, null: false
    add_column :voters, :password, :string, null: false
  end
end
