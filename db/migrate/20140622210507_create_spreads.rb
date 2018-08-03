class CreateSpreads < ActiveRecord::Migration[4.2]
  def change
    create_table :spreads do |t|
      t.integer :game_id
      t.float :pr_spread
      t.integer :user_id
      t.float :proj_spread
      t.float :proj_total

      t.timestamps
    end
  end
end
