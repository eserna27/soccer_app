class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :home_team
      t.integer :away_team

      t.timestamps
    end
  end
end
