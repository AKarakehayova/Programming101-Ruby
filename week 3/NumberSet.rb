class NumberSet
  include Enumerable

  def initialize
    @set = []
  end

  def each
    @set.each
  end

  def << number
    unless @set.include? number
      @set << number
    end
  end

  def size
    @set.size
  end

  def empty?
    @set.empty?
  end

  def [] filter
    filtered_numbers = NumberSet.new
    @set.each do |number|
      if filter.filter_number(number)
        filtered_numbers << number
      end
    end
    filtered_numbers
  end

end

class Filter
  def initialize(&block)
    @filter = &block
  end

  def filter_number(number)
    @block.call(number)
  end
end

class TypeFilter < Filter
  def initialize(type)
    @type = type
  end

  def filter_type(number)
    case @type
      when :integer then @filter = Proc.new { |number| number.integer? }







