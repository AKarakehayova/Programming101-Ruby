class Hash
  def pick(*keys)
    result = {}
    each do |key, value|
      if *keys.include?(key)
        result[key] = value
      end
    end
    result
  end

  def pick2(*keys)
    Hash.new.tap do |h|
      each do |k, v|
        h[k] = v if keys.include? k
      end
    end
  end


  def except(*keys)
    self.each do |key,value|
      unless *keys.include?(key)
        result[key] = value
      end
    end
    result
  end

  def compact_values
    select{|key, value| value}
   end

  def defaults(hash)
    result = self.dup
    hash.each do |key, value|
      if self.has_key?(key) == false
        result[key] = value
      end
    end
    result
  end






end