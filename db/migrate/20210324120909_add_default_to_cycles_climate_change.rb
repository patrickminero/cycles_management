class AddDefaultToCyclesClimateChange < ActiveRecord::Migration[6.0]
  def change
    change_column :cycles, :climate_change, :integer, default: 0
  end
end
