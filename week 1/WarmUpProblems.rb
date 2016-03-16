
#iterative
def fact(n)
  result = 1
  while n > 0
    result = result*n
    n -= 1
  end
end

#recursive
def fact(n)
  return 1 if n == 0
  1.upto(n).reduce(&:*)
end

# Lucas
def helper(n, first, second)
  count = 1
  if n==0
    return 2
  elsif n==1
    return 1
  end

  while count < n
    temp = first
    first = second
    second += temp
    count += 1
    second
  end
  second
end

def nth_lucas(n)
  helper(n, 2, 1)
end

def first_lucas(n)
  result = []
  count = 0
  while count < n
    result[count] = nth_lucas(count)
    count += 1
  end
  result
end

def count_digits(n)
  count = 1
  while n > 9
    count += 1
    n = n / 10
  end
  count
end

def sum_digits(n)
  if n<10
    n
  else  n % 10 + sum_digits(n / 10)
  end
end

def factorial_digits(n)
  if n < 10
    fact(n)
  else fact(n % 10) + factorial_digits(n / 10)
  end
end


def first_fibs(n)
  a, b = 1, 1
  result = [a]

  2.upto(n) do
    a, b = b, a + b
    result << a
  end

  result
end

def fib_number(n)
  first_fibs(n).join('').to_i
end

def hack?(n)
  bn = n.to_s 2
  bn.count('1').odd? && bn.reverse == bn
end

def next_hack(n)
  n = n.next
  n = n.next until hack? n
  n
end

def count_consonants(str)
  string = str.downcase.chars
  count = 0
  consonants = "bcdfghjklmnpqrstvwxz"
  string.each do |letter|
    if consonants.include? letter
      count += 1
    end
  end
  count
end

def count_vowels(str)
  string = str.downcase.chars
  count = 0
 vowels = "aeiuoy"
  string.each do |letter|
      if vowels.include? letter
          count += 1
      end
  end
  count
end


def palindrome?(object)
  object.to_s.reverse == object.to_s
end

def is_int_palindrome(n)
  str = n.to_s
  reverse = str.reverse
  if reverse.eql?(str)
    true
  else false
  end
end

def p_score(n)
  reverse = n.to_s.reverse
  if palindrome? (n)
     1
  else 1 + p_score(n + reverse.to_i)
  end
end

def is_digit?(n)
  "1234567890".chars.include? n
end

def sum_of_numbers_in_string(str)
  result = 0
  chars = str.chars

  while chars.length > 0
    ns = chars.take_while { |ch| is_digit? ch }
    result += ns.join('').to_i

    if ns.length == 0
      chars = chars.drop_while { |ch| !is_digit? ch }
    else
      chars = chars.drop(ns.length)
    end
  end

  result
end

def anagrams?(a, b)
  a.chars.sort == b.chars.sort
end

def balanced?(n)
  n = n.to_s
  mid = n.length / 2

  left_part = n.slice(0, mid)
  right_part = n.slice(mid + n.length % 2, n.length)

  sum_digits(left_part.to_i) == sum_digits(right_part.to_i)
end

def zero_insert(n)
  result = ''
  index, n = 0, n.to_s

  while index < n.length - 1
    a, b = n[index].to_i, n[index + 1].to_i

    result += a.to_s
    result += '0' if a == b || (a + b) % 10 == 0

    index += 1
  end

  result += n[index]
  result.to_i
end

def prime?(num)
  return false if num <= 1
  Math.sqrt(num).to_i.downto(2).each {|i| return false if num % i == 0}
  true
end

def first_primes(n)
  array = []
  index = 2
  until array.length == n
    array.push(index) if prime?(index)
    index += 1
  end
  array
end

def sieve(n)
  array = [2]
  index = 3
  until array.length == n
    has_divisor = true
    array.each { |p| has_divisor = false if index % p == 0 }
    array << index if has_divisor
    index += 1
  end
  array
end