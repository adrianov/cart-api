# Cart of Products
class Cart
  attr_accessor :products

  def initialize
    self.products = {}
  end

  def add_product!(product, quantity)
    products[product.id] ||= 0
    products[product.id] += quantity
  end

  def remove_product!(product, quantity)
    products[product.id] -= quantity
  end
end
