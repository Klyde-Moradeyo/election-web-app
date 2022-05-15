class AddFieldsInVoter < ActiveRecord::Migration[7.0]
  def change
    add_column :voters, :email, :string
    add_column :voters, :password, :string
  end
end
