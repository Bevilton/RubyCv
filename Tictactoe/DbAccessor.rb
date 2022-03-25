require 'otr-active_record'
require 'json'
require_relative './Game'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class GameRecord < ApplicationRecord
  self.table_name = 'games'
  self.primary_key = 'id'
end

class DbAccessor
  def save_game 
    
  end

  def load_game
  end
end

ga = Game.new
board = ga.board.to_json
g = GameRecord.new(time: ga.date_time, current_player: ga.current_player, json_board: board)
g.save

game = GameRecord.first

s = 456