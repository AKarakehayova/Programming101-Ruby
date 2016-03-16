# Implementation of our own Enumerable class
module MyEnumerable
  def map
    [].tap do |arr|
      each do |element|
        value = yield element
        arr << value
      end
    end
  end

  def map
    return enum_for(:map) unless block_given?
    Array.new.tap do |arr|
      each do |element|
        value = yield element
        arr << value
      end
    end
  end

  def filter
    return enum_for(:filter) unless block_given?
    [].tap do |arr|
      each do |element|
        value = yield element
        arr << value if value
      end
    end
  end

  def reject
    return enum_for(:reject) unless block_given?
    Array.new.tap do |arr|
      each do |element|
        value = yield element
        arr << value unless value
      end
    end
  end

  def reduce(initial = nil)
    return enum_for(:reduce) unless block_given?
    skip_first = false

    if initial.nil?
      initial = first
      skip_first = true
    end

    each do |x|
      if skip_first
        skip_first = false
        next
      end
      initial = yield initial, x
    end

    initial
  end

  def negate_block(&block)
    Proc.new { |x| !block.call(x) }
  end

  def reject(&block)
    filter(negate_block(&block))
  end

  def size
    map { |x| 1 }.reduce(0) { |acc, x| acc + x }
  end

  def any?(&block)
    filter(&block).size > 0
  end

  def all?(&block)
    filter(&block).size == size
  end

  def include?(element)
    # Your code goes here
  end

  def count(element = nil)
    if element.nil?
      return size
    end

    filter { |x| x == element }.size
  end


  def min
    # Your code goes here.
  end

  def min_by
    # Your code goes here.
  end

  def max
    # Your code goes here.
  end

  def max_by
    # Your code goes here.
  end

  def take(n)
    taken, count = [], 0
    each do |element|
      taken << element if n > count
      count += 1
    end
    taken
  end

  def take_while
    taken = []
    each do |element|
      taken << element if yield element
    end
    taken
  end

  def drop(n)
    result, count = [] , 0
    each do |element|
      result << element if count >= n
      count += 1
    end
    result
  end

  def drop_while
    result, bool = [], false
    each do |element|
      if yield element == false
        bool = true
      end
      result << element if bool
    end
    result
  end
end