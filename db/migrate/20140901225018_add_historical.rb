class AddHistorical < ActiveRecord::Migration[4.2]
  def change

    create_table :historicals do |t|
      t.integer :year
      t.string :home_team
      t.string :away_team
      t.float :spread
      t.float :total
      t.integer :h1q
      t.integer :h2q
      t.integer :h3q
      t.integer :h4q
      t.integer :hot
      t.integer :hscore
      t.integer :a1q
      t.integer :a2q
      t.integer :a3q
      t.integer :a4q
      t.integer :aot
      t.integer :ascore
      t.timestamps
    end
  end
end
