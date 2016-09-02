require_relative 'weeks_fake'

module WeekStoreFake
  def self.save_week(week)
    true
  end

  def self.find_week(week_id)
    WeekFake.new(week_id)
  end
end
