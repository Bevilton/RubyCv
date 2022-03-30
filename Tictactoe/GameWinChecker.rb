class GameWinChecker
  attr_accessor :winning_count, :size

  def initialize(winning_count, size)
    @winning_count = winning_count
    @size = size
  end

  def _row_win?(x, y, player_id, board)
    @winning_count.times do |i|
      return false if
        (x + i) >= @size ||
        board[y][x + i] != player_id
    end
    true
  end

  def _first_diagonal_win?(x, y, player_id, board)
    @winning_count.times do |i|
      return false if (x + i) >= @size || (y + i) >= @size
      return false if board[y + i][x + i] != player_id
    end
    true
  end

  def _second_diagonal_win?(x, y, player_id, board)
    @winning_count.times do |i|
      return false if (x - i).negative? || (y + i) >= @size
      return false if board[y + i][x - i] != player_id
    end
    true
  end

  def _column_win?(x, y, player_id, board)
    @winning_count.times do |i|
      return false if (y + i) >= @size
      return false if board[y + i][x] != player_id
    end
    true
  end

  def player_win?(player_id, board)
    board.each_with_index do |column, y|
      column.each_with_index do |_, x|
        return true if
          _row_win?(x, y, player_id, board) ||
          _column_win?(x, y, player_id, board) ||
          _first_diagonal_win?(x, y, player_id, board) ||
          _second_diagonal_win?(x, y, player_id, board)
      end
    end
    false
  end
end
