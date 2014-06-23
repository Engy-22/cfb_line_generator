class AddNeutralDefault < ActiveRecord::Migration
  def change
     change_column :games, :neutral, :boolean, default: false

  end
end
