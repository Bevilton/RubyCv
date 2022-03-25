require 'time'
require_relative './BoardPrinter'
require_relative './GameWinChecker'
require_relative './InputParser'
# require_relative './DbAccessor'

class Game
  attr_accessor :board, :size, :current_player, :date_time, :winning_count, :win_checker, :input_parser, :board_printer, :db_accessor

  def initialize(size = 15)
    @size = size
    @board = Array.new(size){ Array.new(size) }
    @current_player = 1
    @date_time = Time.now()
    @winning_count = 5
    @win_checker = GameWinChecker.new(winning_count, size)
    @input_parser = InputParser.new
    @board_printer = BoardPrinter.new(size)
    @db_accessor = DbAccessor.new
  end

  def _switch_player
    @current_player > 1 ? @current_player == 2 : 1
  end

  def play
    loop do
      @board_printer.print_board(@board)
      player_input = @input_parser.get_player_input(@current_player, @board)
      @db_accessor.save_game(self) if player_input == 's'
      return if player_input.nil? || player_input == 's'

      @board[player_input[0]][player_input[1]] = @current_player
      if @win_checker.player_win?(@current_player, @board)
        @board_printer.print_board(@board)
        puts "Congratulations! Player #{@current_player} has won!"
        return
      end
      _switch_player
    end
  end
end