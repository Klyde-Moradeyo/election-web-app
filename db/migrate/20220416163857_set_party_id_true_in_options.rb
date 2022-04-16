class SetPartyIdTrueInOptions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :options, :party_id, true
  end
end
