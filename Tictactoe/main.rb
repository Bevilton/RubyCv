class Game
  attr_accessor :board, :size, :current_player

  def initialize(size = 15)
    @size = size
    @board = Array.new(size){ Array.new(size) }
    @current_player = 0
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
        out += y unless y.nil?
        out += '|'
      end
      puts out
    end
  end

  def play
    
  end

  def current_player_win?
    
  end
end

def start_game
  puts 'Game started!'
  game = Game.new
  game.print_board
end

def load_game
  puts 'load'
end

def quit
  puts 'quit'
end

def main
  innit_message = <<-END
  Welcome to Tic-tac-toe. What do you want to do?
  1: Start new game
  2: Load game
  3: Quit
  END
  puts innit_message

  case gets.gsub!(/\s+/, "")
  when '1'
    start_game
  when '2'
    load_game
  when '3'
    quit
  else
    puts "Wrong input"
  end
end

main