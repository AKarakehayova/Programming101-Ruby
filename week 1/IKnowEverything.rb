
def button(symbol, repeat)
  if symbol == "7" || symbol == "9"
    repeat % 4 -1
  else repeat % 3 -1
  end
end

def numbers_to_message(pressedSequence)
    sequences = pressedSequence.join('').scan(/((.)\2*)/).map(&:first)
    result = ""
    keyboard=
  [["1"], ["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"], ["m", "n",  "o"],
   ["p", "q",  "r",  "s"], ["t", "u",  "v"], ["w", "x", "y", "z"], ['*'], [' ', '0'], ['#']]
   index, length = 0, sequences.length
   while index < length
     if sequences[index].chars.first == "-"
         index += 2
     elsif sequences[index].chars.first == "1"
        result << keyboard[sequences[index + 1].chars.first.to_i - 1][button(sequences[index + 1].chars.first, sequences[index + 1].length)].capitalize
        index += 2
     elsif sequences[index].chars.first == "0"
       result<< " "
       index += 1
     else  result << keyboard[sequences[index].chars.first.to_i - 1][button(sequences[index].chars.first, sequences[index].length)]
         index += 1
     end

    end
    result
end



def helper(letter)
    result = []
    keyboard =
  [["1"], ["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"], ["m", "n",  "o"],
   ["p", "q",  "r",  "s"], ["t", "u",  "v"], ["w", "x", "y", "z"], ['*'], [' ', '0'], ['#']]
   keyboard.each_with_index do |button, index|
       if button.include? letter
           button.each_with_index do |l, i|
               if l == letter
                   0.upto(i) {result << index + 1}
                end
            end
        end
    end
    result
end

def which_button(letter)
     keyboard =
  [["1"], ["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"], ["j", "k", "l"], ["m", "n",  "o"],
   ["p", "q",  "r",  "s"], ["t", "u",  "v"], ["w", "x", "y", "z"], ['*'], [' ', '0'], ['#']]
  keyboard.each_with_index do |button, index|
      if button.include? letter
          return index
      end
     end
end


def message_to_numbers(message)
    message_array = message.chars
    result = []
    length = message_array.length
    count = 0
    while count < length
      if message_array[count] == " "
          result << 0
      elsif message_array[count].ord < 97
         result << 1
         capital_letter = message_array[count].downcase
         result << helper(capital_letter)
       elsif count >= 1 && which_button(message_array[count - 1]) == which_button(message_array[count])
         result << -1
         result << helper(message_array[count])
       else result << helper(message_array[count])
     end
     count += 1
    end
    result.flatten
end

def prepare_meal(number)
  n, max_n = 0, 0
  result = ""
  while 3**n <= number
    if number % 3**n == 0 && max_n < n
      max_n = n
    end
    n += 1
  end


  result += "spam "*max_n
  result.chop!
  if number % 5 == 0
    if result.empty? == true
        result += "eggs"
    else result += " and eggs"
    end
  end
  result
end

def an_bn?(word)
  if word.length % 2 !=0
    return false
  else
  count = 0
  a_part=word.slice(0, word.length/2)
  b_part=word.slice(word.length/2, word.length)
  no_different_letters = true
    while count < word.length/2
      if word[count] != 'a' || word[word.length / 2 + count] != 'b'
        no_different_letters = false
      end
      count += 1
    end
  end
  no_different_letters
end

def valid_credit_card?(number)
  array = number.to_s.chars
  if array.length.even?
    return false
  end
  reversed = array.reverse
  reversed.map!{ |sym| sym.to_i }
  count = 0
  while count < array.length
    if count %2 != 0
      reversed[count] *= 2
    end
    count+=1
  end
  sum = reversed.to_s.chars.map!{|s| s.to_i}.reduce(:+)
  if sum % 10 == 0
    true
  else false
  end
end

def is_prime?(num)
  return false if num <= 1
  Math.sqrt(num).to_i.downto(2).each {|i| return false if num % i == 0}
  true
end

def goldbach(n)
  count = 2
  array = []
  while count <= (n / 2)
    if (is_prime?(count) and is_prime?(n-count))
      array << [count, n - count]
    end
    count += 1
  end
  array
end

def magic_square?(square)
sum = square[0].reduce(:+)
  left_diagonal_sum, right_diagonal_sum = 0, 0
  square.each_with_index { |line, index| left_diagonal_sum += line[index] }
  square.each_with_index { |line, index| right_diagonal_sum += line.reverse[index] }
  square.all? { |line| line.reduce(:+) == sum } and
  square.transpose.all? { |line| line.reduce(:+) == sum } and
  left_diagonal_sum == sum and
  right_diagonal_sum == sum
 end



def reduce_file_path(path)
  result_array = []
  result_string = "/"
  directory = ""
  (path + "/").each_char { |char|
    if char == "/"
      if directory ==  ".."
        result_array.pop
      elsif directory ==  "."
        directory = ""
      else
        result_array << directory if directory.size > 0
      end
        directory = ""
    else directory << char
    end
  }
  result_array.each { |elem|
    result_string << (elem + "/")
  }
  result_string.chop! if result_string.size > 1
  result_string
end