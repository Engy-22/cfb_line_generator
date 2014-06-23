class AddHfaToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :hfa, :float
  end
end
