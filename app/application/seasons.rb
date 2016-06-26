require_relative 'seasons/season'

module Seasons
  def self.create(params)
    Season.new(params)
  end
end
