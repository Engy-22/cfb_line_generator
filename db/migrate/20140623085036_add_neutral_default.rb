class AddNeutralDefault < ActiveRecord::Migration[4.2]
  def change
     change_column :games, :neutral, :boolean, default: false

  end
end
