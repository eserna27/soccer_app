module Teams
  class Team
    attr_reader :name, :twitter, :hashtags, :id, :logo
    attr_accessor :errors

    def initialize(params)
      @name = params[:name]
      @twitter = params[:twitter]
      @id = params[:id]
      @hashtags = params[:hashtags]
      @logo = params[:logo]
      @errors = []
    end

    def self.new_team(params)
      new({
        name: params[:name],
        twitter: params[:twitter],
        hashtags: params[:hashtags],
        logo: params[:logo]
        })
    end

    def self.new_team_from_store(team_from_store)
      new({
        name: team_from_store.name,
        twitter: team_from_store.twitter,
        hashtags: team_from_store.hashtags,
        id: team_from_store.id,
        logo: team_from_store.logo
        })
    end

    def validates_params
      add_error("name_necessary") if name == "" || name == nil
      add_error("twitter_necessary") if twitter == "" || twitter == nil
    end

    def params
      {
        name: name,
        twitter: twitter,
        hashtags: hashtags,
        logo: logo
      }
    end

    private

    def add_error(error)
      errors << error
    end
  end
end
