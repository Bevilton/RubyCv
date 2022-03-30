class BoardPrinter
  attr_accessor :size

  def initialize(size)
    @size = size
  end

  def print_board(board)
    out = "\t|"
    @size.times{ |i| out += (i + 1).to_s + '|' }
    puts out
    puts

    board.each_with_index do |x, i|
      out = '|' + (i + 1).to_s + "|\t|"
      x.each_ do |y|
        out += ' ' if y.nil?
        out += y.to_s unless y.nil?
        out += '|'
      end
      puts out
    end
  end
end
