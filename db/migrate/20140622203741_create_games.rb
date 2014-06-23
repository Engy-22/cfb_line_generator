class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :visitor_id
      t.integer :home_id
      t.integer :visitor_rot
      t.integer :home_rot
      t.boolean :neutral
      t.integer :visitor_score
      t.integer :home_score
      t.float :closing_spread
      t.date :date

      t.timestamps
    end
  end
end
