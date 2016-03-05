

module T9Map
  MAP = [ ' ', nil, 'abc', 'def', 'ghi', 'jkl', 'mno', 'pqrs', 'tuv', 'wxyz' ]
  
  def numbers_to_char(num)
    numbers = num.split('')
    parts = {}

    numbers.each_with_index do |n, i|
      parts[n] = MAP[n.to_i]
    end

    map = {}
    num.split('').each do |c|
      map[c] ||= ''
      map[c] << c
    end

    result = []
    map.each do |key, value|
      index = value.length - 1
      result << parts[key][index]
    end

    return result
  end
end

class T9SMS
  include T9Map

  def initialize(input)
    @input = []
    @result = []

    ary = input.to_s.split(' ')

    ary.each do |i|
      i.gsub!('0', ' 0 ')
      @input += i.split(' ')
    end
  end

  def decode
    @input.each do |i|
      @result += numbers_to_char(i)
    end
    @result.join
  end
end

