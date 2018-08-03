class AddDataToGame < ActiveRecord::Migration[4.2]
  def change
    add_column :games, :data, :string
  end
end
