require 'time'

class GameModel
  attr_accessor :id, :board, :size, :current_player, :date_time, :winning_count

  def initialize(size = 15)
    @size = size
    @board = Array.new(size) { Array.new(size) }
    @current_player = 1
    @date_time = Time.now
    @winning_count = 5
    @id = 0
  end
end
