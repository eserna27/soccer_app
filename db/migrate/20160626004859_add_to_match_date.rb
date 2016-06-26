class AddToMatchDate < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :date, :datetime
  end
end
