class InputParser
  def _input_is_valid?(coords, board)
    if coords.count != 2
      puts 'Only two values separated by space are allowed.'
      return false
    end
    if coords.all?{|x| x.match (/^[0-9]*$/)} == false
      puts 'Coordinates must be numbers.'
      return false
    end
    if coords.all?{|x| x.to_i < 1 && x.to_i > 15}
      puts 'Coordinates must be greater or equal to 0 and smaller than 15.'
      return false
    end

    int_coords = coords.map{ |x| a = x.to_i - 1}
    if !board[int_coords[0]][int_coords[1]].nil?
      puts 'This place is already full.'
      return false
    end

    int_coords
  end

  def get_player_input(current_player, board)
    puts "Player #{@current_player} is playing..."
    puts "Where do you want to play? (type two coordinates like '11 2' or 'q' for going back to main menu or 's' for saving the game)."
    input = gets.strip
    while input != 'q' && input != 's' do
      str_coords = input.split(' ')
      int_coords = _input_is_valid?(str_coords, board)
      return int_coords if int_coords

      input = gets
    end
    _save_game if input == 's'
    puts 'Returning to main menu...'
    nil
  end
end