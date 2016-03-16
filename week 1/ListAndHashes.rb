def number_to_digits(number)
  array = number.to_s.chars
  array.map{|num| num.to_i}
end

def digits_to_number(array)
  array.map{|num| num.to_s}.join.to_i
end


def max_scalar_product(v1, v2)
  v1 = v1.sort
  v2 = v2.sort
  i, sum = 0, 0
  while i < v1.length
    sum += v1[i] * v2[i]
    i += 1
  end
  sum
end

def max_span(numbers)
  max = 0
  reverse = numbers.reverse
  numbers.each_with_index do |digit, i|
    index = reverse.find_index(digit)
    if (numbers.size - index) - i > max
      max = (numbers.size - index) - i
    end
  end
  max
end

def sum_matrix(matrix)
  matrix.flatten.reduce :+
end

def group(items)
    groups = []
    while !items.empty?
      groups << items.take_while {|i| i == items.first}
      length = items.take_while {|i| i == items.first}.length
      items.shift length
    end
    groups
end

def max_consecutive(items)
    max = 0
    while !items.empty?
      if items.take_while {|i| i == items.first}.length > max
          max = items.take_while {|i| i == items.first}.length
      end
      items.slice!(0)
    end
    max
end


def matrix_bombing_plan(matrix)
  i = 0
  j = 0
  bombs = {}
  sum_all = sum_matrix(matrix)
  while i < matrix.size
    j = 0
    while j < matrix[i].size
      sum = 0
      sum += [matrix[i + 1][j], matrix[i][j]].min if i + 1 < matrix.size
      sum += [matrix[i + 1][j + 1], matrix[i][j]].min if i + 1 < matrix.size and j + 1 < matrix[i + 1].size
      sum += [matrix[i + 1][j - 1], matrix[i][j]].min if j > 0 and i + 1 < matrix.size
      sum += [matrix[i][j + 1], matrix[i][j]].min if matrix[i][j + 1] != nil
      sum += [matrix[i][j - 1], matrix[i][j]].min if j > 0
      sum += [matrix[i - 1][j + 1], matrix[i][j]].min if i > 0 and matrix[i - 1][j + 1] != nil
      sum +=[matrix[i - 1][j], matrix[i][j]].min if i > 0
      sum += [matrix[i - 1][j - 1], matrix[i][j]].min if i > 0 and j > 0
      bombs[Array[i, j]] = sum_all - sum
      j += 1
    end
    i += 1
  end
 bombs
end

def grayscale_histogram(image)
  histogram = Array.new(256, 0)
  row, column = 0, 0
  while row < image.size
    column = 0

    while column < image[row].length
      pixel = image[row][column]
      histogram[pixel] += 1
      column += 1
    end

    row += 1
  end
  histogram
end