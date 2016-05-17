require_relative 'match_fake'

module MatchStoreFake
  def self.save_match(match)
    true
  end

  def self.all_matches
    [
      MatchFake.new,
      MatchFake.new
    ]
  end
end
