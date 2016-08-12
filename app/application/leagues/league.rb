module Leagues
  class League
    attr_reader :name, :location

    def initialize(params)
      @name = params[:name]
      @location = params[:location]
    end

    def self.new_league(params)
      new({
        name: params[:name],
        location: params[:location]
      })
    end

    def params
      {
        name: name,
        location: location
      }
    end
  end
end
