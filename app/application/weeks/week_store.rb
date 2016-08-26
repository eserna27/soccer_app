module Weeks
  class WeekStore
    def self.save_week(week)
      ::Week.create(week.params)
    end

    def self.find_week(week_id)
      ::Week.find(week_id)
    end
  end
end
