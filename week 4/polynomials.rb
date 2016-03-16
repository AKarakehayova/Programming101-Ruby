class Polynomial
  def initialize polynomial
    @polynomial = polynomial
  end

  def derivative @polynomial
    monomial = @polynomial.split('+')
    length = monomial.length
    index = 0
    result = ""
    while index < length
      current_mon = monomial[index].chars
      current_length = current_mon.length
      current_index = 0
      while index < length
        if current_mon[index].is_a? Integer
          coef = current_mon[index]
        elsif current_mon[index] == 'x'
          parameter = 'x'
        elsif current_mon[index] == '^'
          sign = '^'
          power = current_mon[index + 1]
        end





      #####elsif formula[index] == 'x' and formula[index + 1] != '^' and formula[index]







      end

