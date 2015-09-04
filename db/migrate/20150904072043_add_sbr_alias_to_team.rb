class AddSbrAliasToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :sbr_alias, :string
  end
end
