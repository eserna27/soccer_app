class AddWeekToMatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :week, foreign_key: true
  end
end
