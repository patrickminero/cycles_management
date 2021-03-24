class AddDefaultToCyclesWaterUse < ActiveRecord::Migration[6.0]
  def change
    change_column :cycles, :water_use, :integer, default: 0
  end
end
