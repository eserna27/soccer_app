class CreateSeasonRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :season_registrations do |t|
      t.references :team, foreign_key: true
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
