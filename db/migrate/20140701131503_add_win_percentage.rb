class AddWinPercentage < ActiveRecord::Migration
  def change
    add_column :spreads, :home_win_percentage, :float
    remove_column :spreads, :pr_spread

  end
end
