class AddTeamIdClubToLigaMx < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :id_club, :integer
  end
end
