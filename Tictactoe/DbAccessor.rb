require 'active_record'
require 'json'
require_relative './models/GameModel'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', database: 'Tictactoe/db/test.db'
)

class GameRecord < ActiveRecord::Base
  self.table_name = 'games'
  self.primary_key = 'id'
end

class DbAccessor
  def save_game(game)
    record_exists = GameRecord.where(id: game.id).exists?(conditions = :none)
    if record_exists
      _update_game game
      return
    end
    record = GameRecord.new(time: game.date_time, current_player: game.current_player, json_board: game.board.to_json)
    record.save
  end

  def _update_game(game)
    record = GameRecord.find(game.id)
    record.current_player = game.current_player
    record.json_board = game.board.to_json
    record.save
  end
  
  def _map_record_to_model(record)
    game = GameModel.new
    game.current_player = record.current_player
    game.date_time = record.time
    game.board = JSON.parse(record.json_board)
    game.id = record.id
    game
  end
  
  def load_game(id)
    record = GameRecord.find(id)
    game = _map_record_to_model(record)
  end

  def get_games
    records = GameRecord.all
    games = []
    records.each{|r| games.append(_map_record_to_model(r))}
    games
  end

  def delete_game(id)
    GameRecord.delete(id)
  end
end

# puts "Tables: #{ActiveRecord::Base.connection.tables}"

# g = GameModel.new
# g.board[2][1] = 1
# g.id = 1

# accessor = DbAccessor.new
# games = accessor.get_games
# puts games[1].board[0][0].nil?
#accessor.save_game g
#game = accessor.load_game(1)
#accessor.delete_game(1)