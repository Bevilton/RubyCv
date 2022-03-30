require_relative './Game'
require_relative './DbAccessor'

def start_game
  puts 'Game started!'
  game = Game.new
  game.play
end

def load_game(id)
  accessor = DbAccessor.new
  model = accessor.load_game(id)
  puts 'Game loaded!'
  game = Game.new(model)
  game.play
end

def view_games
  accessor = DbAccessor.new
  loop do
    puts 'Current games:'
    games = accessor.get_games
    games.each{ |g| puts "Id: #{g.id}, started: #{g.date_time}" }
    puts <<-TEXT
      What do you want to do? 
      'b' for back
      'd 1' for delete game with id 1
      'l 1' for load game with id 1
    TEXT

    input = gets.strip
    if input.length == 0
      puts 'No input found.'
    end
    return if input == 'b'

    values = input.split(' ')
    if values.count != 2
      puts 'Invalid number of arguments.'
      next
    end

    unless values[1].match(/^[0-9]*$/)
      puts "Identifier must be a number but was #{values[1]}."
      next
    end

    if values[0] == 'l'
      load_game(values[1].to_i)
      return
    elsif values[0] == 'd'
      accessor.delete_game values[1].to_i
    else
      puts "Invalid command: #{values[0]}."
    end
  end
end

def quit
  puts 'quit'
end

def main
  loop do
    puts <<-TEXT
    Welcome to Tic-tac-toe. What do you want to do?
    1: Start new game
    2: View games
    3: Quit
    TEXT

    case gets.strip
    when '1'
      start_game
    when '2'
      view_games
    when '3'
      puts 'Quitting...'
      return
    else
      puts 'Wrong input!'
    end
  end
end

main
