class Cycle < ApplicationRecord
  validates :name, presence: true

  def categories_sum(climate_change, water_use)
    self.climate_change += climate_change
    self.water_use += water_use
    save!
  end

  def categories_reduce(climate_change, water_use)
    self.climate_change -= climate_change
    self.water_use -= water_use
    save!
  end
  
end
