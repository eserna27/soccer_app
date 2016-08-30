class CreateMatchesAgain < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.datetime :date
      t.references :week, foreign_key: true
    end
  end
end
