class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.integer :week_number
      t.references :season, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
