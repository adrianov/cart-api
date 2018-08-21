# Cart of Products
class Cart
  # Array of Hashes { product: product, quantity: 0 }
  attr_accessor :products

  def initialize
    self.products = {}
  end

  def add_product!(product, quantity)
    products[product.id] ||= { product: product, quantity: 0 }
    products[product.id][:quantity] += quantity
  end

  def remove_product!(product, quantity)
    products[product.id][:quantity] -= quantity
  end

  def total_sum
    products.map do |_, item|
      item[:product].price * item[:quantity]
    end.sum
  end
end
