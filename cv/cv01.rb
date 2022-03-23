def to_camel_case(str)
    new_str = ""
    reverse = true

    str.split('').each do |c|
        if "_".include? c
            reverse = true
            next
        end
        new_str += c.upcase if reverse
        new_str += c.downcase unless reverse
        reverse = false if reverse
    end
    return new_str
end

def to_camel_case_2(str)
    str.split('_').map(&:capitalize).join
end

def to_camel_case_3(str)
    str.split('_').map{|c| c.capitalize}.join
end

def count_vowels(s)
    count = 0
    s.split('').each {|c| count += 1 if "aeiou".include? c}
    return count
end

def count_vowels_2(s)
    s.count('aeiou')
end

def area_of_triangle(a, b, c)
    return a*b/2  
end

class Fibonacci
    attr_accessor :prev_current
    attr_accessor :current

    def initialize()
      @current = 1
      @prev_current = 1
    end

    def current
        return @current
    end

    def next
        c = @current
        @current = c + @prev_current
        @prev_current = c

        return @current
    end
end

def rubify_path(path)
    str = path.split('/').map{|p| to_camel_case_2(p)}.join("::")

    raise "this is ruby, u dumb" unless str.end_with? ".rb"
    str
end

puts rubify_path "RAILS/APP/CONTROLLERS/APP_CONTROLLER.RB"

