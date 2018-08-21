# Cart of Products
class Cart
  # Array of CartItems
  attr_accessor :products

  def initialize
    self.products = {}
  end

  def add_product!(product, quantity)
    products[product.id] ||= CartItem.new(product: product, quantity: 0)
    products[product.id].quantity += quantity
  end

  def remove_product!(product, quantity = 1)
    products[product.id].quantity -= quantity
  end

  def total_sum
    products.values.map(&:sum).sum
  end

  def products_count
    products.values.map(&:quantity).sum
  end

  def as_json(_options = {})
    {
      total_sum: total_sum,
      products_count: products_count,
      products: products.values.map(&:as_json)
    }
  end
end
