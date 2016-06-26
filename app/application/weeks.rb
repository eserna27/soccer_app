require_relative 'weeks/week'

module Weeks
  def self.create_week(params)
    Week.new(params)
  end
end
