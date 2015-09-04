class AddDataToGame < ActiveRecord::Migration
  def change
    add_column :games, :data, :string
  end
end
