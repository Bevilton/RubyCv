# frozen_string_literal: true

# heredoc
a = '111'
t = <<-END
  asdas
  ddd #{a}
END

# modules
module M
  def x
    puts 'asd'
  end
end

arr = %w[1 2 3]

def find(name)
  result = `node ../test.js #{name}`
  result2 = result.split('{')
  movies = result2.find_all {|m| m.include?("title")}
  movies.each do |m|
    parts = m.split(',').each{|p| p.gsub!(/\s+/, "");p.gsub!("'", '');p.gsub!('\\', '')}
    parts.each do |p|
      puts "Title: #{p.split(':')[1]}" if p.include?("title")
      puts "Year: #{p.split(':')[1]}" if p.include?("year")
      puts "Type: #{p.split(':')[1]}" if p.include?("type")
    end
    puts
  end
end

inp = $stdin.read
find inp

