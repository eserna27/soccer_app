require_relative '../teams'
require 'active_model'

module Matches
  class Match
    include ActiveModel::Model

    attr_reader :home_team, :away_team ,:date, :week, :home_team_id, :away_team_id, :week_id, :id
    #attr_accessor :errors

    def initialize(params)
      @home_team = params[:home_team]
      @away_team = params[:away_team]
      @home_team_id = params[:home_team_id]
      @away_team_id = params[:away_team_id]
      @date = params[:date]
      @week = params[:week]
      @week_id = params[:week_id]
      @id = params[:id]
    #  @errors = []
    end

    def self.new_match(params)
      new({
        home_team: params[:home_team],
        away_team: params[:away_team],
        date: params[:date],
        week: params[:week]
        })
    end

    def self.create_from_form(params)
      new({
        home_team_id: params[:home_team_id],
        away_team_id: params[:away_team_id],
        date: params[:date],
        week_id: params[:week_id]
        })
    end

    def self.new_match_from_store(match, store_team)
      new({
        home_team: find_team(match.home_team_id, store_team),
        away_team: find_team(match.away_team_id, store_team),
        date: match.date,
        week: match.week,
        id: match.id
      })
    end

    def self.list_matches(matches, team_store)
      matchs = matches.map{ |match|
        new_match_from_store(match, team_store)
      }
    end

    def self.new_for_form(week)
      new({
        home_team_id: 0,
        away_team_id: 0,
        date: DateTime.now,
        week_id: week.id
        })
    end

    def validate
      (home_team == "" || away_team == "") && add_error("miss_team")
      (home_team == away_team) && add_error("same_team")
      date.nil? && add_error("need_date")
    end

    def params
      {
        home_team_id: home_team_id,
        away_team_id: away_team_id,
        date: date,
        week_id: week_id
      }
    end

    private

    def add_error(error)
      errors << error
    end

    def self.find_team(team_id, store_team)
      Teams.view_team(team_id, store_team)
    end
  end
end
