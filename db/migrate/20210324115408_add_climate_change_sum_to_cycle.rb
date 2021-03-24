class AddClimateChangeSumToCycle < ActiveRecord::Migration[6.0]
  def change
    add_column :cycles, :climate_change, :integer
  end
end
