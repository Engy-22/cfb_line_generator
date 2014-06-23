class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :power_ranking
      t.string :offense
      t.string :defense
      t.text :notes
      t.integer :team_id

      t.timestamps
    end
  end
end
