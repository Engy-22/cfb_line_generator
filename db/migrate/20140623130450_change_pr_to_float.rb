class ChangePrToFloat < ActiveRecord::Migration[4.2]
  def change
    remove_column :profiles, :power_ranking
    add_column :profiles, :power_ranking, :float
  end
end
