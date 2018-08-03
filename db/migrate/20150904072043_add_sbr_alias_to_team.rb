class AddSbrAliasToTeam < ActiveRecord::Migration[4.2]
  def change
    add_column :teams, :sbr_alias, :string
  end
end
