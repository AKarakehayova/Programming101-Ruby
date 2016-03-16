class Array
  def to_hash
    h = {}
    self.each{|array| h[array.first] = array.last}
    h
  end

  def index_by(&block)
    h = {}
    self.each do |element|
     h[block.call(element)] = element
    end
    h
  end

  def subarray_count(subarray)
    count = 0
    self.each_cons(subarray.length) do |sub|
      if sub == subarray
        count += 1
      end
    end
    count
  end




  def occurences_count
    h = {}
    self.each do |elem|
      h[elem] = self.occurences(elem)
    end
    h
  end

  def occurences(elem)
    count = 0
    self.each do |element|
      if element == elem
        count += 1
      end
    end
    count
  end
end




