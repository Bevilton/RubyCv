require_relative './BoardPrinter'
require_relative './GameWinChecker'
require_relative './InputParser'
require_relative './DbAccessor'
require_relative './models/GameModel'

class Game
  attr_accessor :game, :win_checker, :input_parser, :board_printer, :db_accessor

  def initialize(size = 15)
    @game = GameModel.new(size)
    @win_checker = GameWinChecker.new(@game.winning_count, size)
    @input_parser = InputParser.new
    @board_printer = BoardPrinter.new(size)
    @db_accessor = DbAccessor.new
  end

  def _switch_player
    @game.current_player > 1 ? @game.current_player == 2 : 1
  end

  def play
    loop do
      @board_printer.print_board(@game.board)
      player_input = @input_parser.get_player_input(@game.current_player, @game.board)
      @db_accessor.save_game(@game) if player_input == 's'
      return if player_input.nil? || player_input == 's'

      @game.board[player_input[0]][player_input[1]] = @game.current_player
      if @win_checker.player_win?(@game.current_player, @game.board)
        @game.board_printer.print_board(@game.board)
        puts "Congratulations! Player #{@game.current_player} has won!"
        return
      end
      _switch_player
    end
  end
end