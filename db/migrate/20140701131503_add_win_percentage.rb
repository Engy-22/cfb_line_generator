class AddWinPercentage < ActiveRecord::Migration[4.2]
  def change
    add_column :spreads, :home_win_percentage, :float
    remove_column :spreads, :pr_spread

  end
end
