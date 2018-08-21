# Cart of Products
class Cart
  # Array of Structs { product: product, quantity: 0 }
  attr_accessor :products

  def initialize
    self.products = {}
  end

  def add_product!(product, quantity)
    item = Struct.new(:product, :quantity)
    products[product.id] ||= item.new(product, 0)
    products[product.id].quantity += quantity
  end

  def remove_product!(product, quantity)
    products[product.id].quantity -= quantity
  end

  def total_sum
    products.values.map do |item|
      item.product.price * item.quantity
    end.sum
  end

  def products_count
    products.values.map(&:quantity).sum
  end
end
