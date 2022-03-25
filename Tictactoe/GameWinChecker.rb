class GameWinChecker
  attr_accessor :winning_count, :size

  def initialize(winning_count, size)
    @winning_count = winning_count
    @size = size
  end

  def _row_win?(x, y, player_id, board)
    @winning_count.times do |i|
      if (x + i) >= @size
        return false
      end
      if board[y][x + i] != player_id
        return false
      end
    end
    true
  end

  def _diagonal_win?(x, y, player_id, board)
    @winning_count.times do |i|
      if (x + i) >= @size || (y + i) >= @size
        return false
      end
      if board[y + i][x + i] != player_id
        return false
      end
    end
    true
  end

  def _column_win?(x, y, player_id, board)
    @winning_count.times do |i|
      if (y + i) >= @size
        return false
      end
      if board[y + i][x] != player_id
        return false
      end
    end
    true
  end

  def player_win?(player_id, board)
    board.each_with_index do |column, y|
      column.each_with_index do |_, x|
        return true if _row_win?(x, y, player_id, board) || _column_win?(x, y, player_id, board) || _diagonal_win?(x, y, player_id, board)
      end
    end
    false
  end
end