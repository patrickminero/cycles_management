class AddWaterUseSumToCycle < ActiveRecord::Migration[6.0]
  def change
    add_column :cycles, :water_use, :integer
  end
end
