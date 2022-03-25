require_relative './Game'

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
  loop do
    puts <<-TEXT
    Welcome to Tic-tac-toe. What do you want to do?
    1: Start new game
    2: Load game
    3: Quit
    TEXT

    case gets.gsub!(/\s+/, "")
    when '1'
      start_game
    when '2'
      load_game
    when '3'
      puts "Quitting..."
      return
    else
      puts 'Wrong input!'
    end
  end
end

main