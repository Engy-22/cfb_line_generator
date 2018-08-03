class AddHfaToProfile < ActiveRecord::Migration[4.2]
  def change
    add_column :profiles, :hfa, :float
  end
end
