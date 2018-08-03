class AddAliasToTeams < ActiveRecord::Migration[4.2]
  def change
    add_column :teams, :alias, :string
  end
end
