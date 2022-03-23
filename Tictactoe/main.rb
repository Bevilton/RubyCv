require 'time'

class Game
  attr_accessor :board, :size, :current_player, :date_time

  def initialize(size = 15)
    @size = size
    @board = Array.new(size){ Array.new(size) }
    @current_player = 1
    @date_time = Time.now()
  end

  def print_board
    out = "\t|"
    @size.times{ |i| out += (i + 1).to_s + "|" }
    puts out
    puts

    @board.each_with_index do |x, i|
      out = "|" + (i+1).to_s + "|\t|"
      x.each_with_index do |y, j|
        out += ' ' if y.nil?
        out += y.to_s unless y.nil?
        out += '|'
      end
      puts out
    end
  end

  def input_is_valid? coords
    if coords.count != 2
      puts "Only two values separated by space are allowed."
      return false
    end
    if coords.all?{|x| x.match (/^[0-9]*$/)} == false
      puts "Coordinates must be numbers."
      return false
    end
    if coords.all?{|x| x.to_i < 1 && x.to_i > 15}
      puts "Coordinates must be greater or equal to 0 and smaller than 15."
      return false
    end

    int_coords = coords.map do |x|
      a = x.to_i
      a -= 1
    end
    if @board[int_coords[0]][int_coords[1]] != nil
      puts "This place is already full."
      return false
    end

    return int_coords
  end

  def save_game
  end

  def get_player_input
    puts "Player #{@current_player} is playing..."
    puts "Where do you want to play? (type two coordinates like '11 2' or 'q' for going back to main menu or 's' for saving the game)."
    input = gets.strip
    while input != "q" && input != "s" do
      str_coords = input.split(' ')
      int_coords = self.input_is_valid? str_coords
      return int_coords if int_coords
      input = gets
    end
    if input == "s"
      self.save_game
    end

    puts "Returning to main menu..."
    nil
  end

  def switch_player
    if @current_player == 1
      @current_player = 2
    else
      @current_player = 1
    end
  end

  def play
    while true do
      self.print_board
      player_input = self.get_player_input
      return unless player_input
      @board[player_input[0]][player_input[1]] = @current_player
      if current_player_win?
        puts "Congratulations! Player #{@current_player} has won!"
        return
      end
      self.switch_player
    end
  end

  def field_is_winning? x, y
  end

  def current_player_win?
    @board.each_with_index do |column, y|
      column.each_with_index do |row, x|
        return true if check_for_winning? x y
      end
    end
  end
end

def start_game
  puts 'Game started!'
  game = Game.new
  game.play
end

def load_game
  puts 'load'
end

def quit
  puts 'quit'
end

def main
  while true do
    puts <<-END
    Welcome to Tic-tac-toe. What do you want to do?
    1: Start new game
    2: Load game
    3: Quit
    END

    case gets.gsub!(/\s+/, "")
    when '1'
      start_game()
    when '2'
      load_game()
    when '3'
      return
    else
      puts "Wrong input"
    end
  end
end

main