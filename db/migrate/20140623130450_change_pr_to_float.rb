class ChangePrToFloat < ActiveRecord::Migration
  def change
    remove_column :profiles, :power_ranking
    add_column :profiles, :power_ranking, :float
  end
end
