require 'bigdecimal'
require 'bigdecimal/util'

class Promotion
  attr_accessor :promotion_types
  def initialize
    @promotion_types = {}
  end

  def type
    case
      when get_one_free



class Product
  attr_reader :product_name, :price, :promotion
  def initialize(product_name, price, promotion = nil)
    @product_name = product_name
    @price = price
    @promotion = promotion
  end
end

class Inventory
  def initialize
    @inventory = []
  end

  def register(product)
    @inventory.push(product)
  end

  def new_cart
    Cart.new
  end

  def register_coupon

  end
end

class Cart
  def initialize
    @cart = {}
  end

  def add(name, count = 1)
    @cart[name] = count
  end

  def invoice
  end

  def use
  end

  def total
    sum = 0
    @cart.each do
      |name, count|
      @inventory.each do
        |product|
      if name == product.product_name
        sum += count * (product.price).to_d
      end
    end
  end
    sum.round(2)
  end
end


  end
end



