class String
  def ipv4_address?
    pattern = Regexp.new('\A[0-2]{,1}[0-5]{,2}[.][0-2]{,1}[0-5]{,2}[.][0-2]{,1}[0-5]{,2}[.][0-2]{,1}[0-5]{,2}\z')
    pattern.match?(self)
  end
end

x = 'asd'
puts x.ipv4_address?

ip1 = '1.1.1.1'
puts ip1.ipv4_address?

def valid_string str
  first = ['(', '[', '{']
  reverse = [')', ']', '}']
  chars = []
  str.split('').each do |c|
    if first.include?(c)
      chars.append(reverse[first.find_index(c)])
      next
    end
    if reverse.include?(c) && chars.count > 0
      if chars.last == c
        chars.pop
        next
      end
    end
    return false
  end
  chars.count == 0
end

valid = "{()[][({})[]]}"
puts valid_string valid