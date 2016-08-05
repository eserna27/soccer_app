class Season < ApplicationRecord
  belongs_to :league
  has_many :teams, through: :season_registrations
  has_many :season_registrations
end
