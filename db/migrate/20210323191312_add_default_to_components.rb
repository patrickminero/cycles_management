class AddDefaultToComponents < ActiveRecord::Migration[6.0]
  def change
    change_column :cycles, :components, :jsonb, default: []
  end
end
