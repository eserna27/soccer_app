class Season < ApplicationRecord
  belongs_to :league
  has_many :weeks
  has_many :teams, through: :season_registrations
  has_many :season_registrations
end
