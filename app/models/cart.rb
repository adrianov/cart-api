# Cart of Products
class Cart
  # Array of CartItems
  attr_accessor :products

  def initialize
    self.products = {}
  end

  def add_product!(product, quantity)
    if products.key? product.id
      products[product.id].quantity += quantity
    else
      products[product.id] = CartItem.new(product: product, quantity: quantity)
    end
  end

  def remove_product!(product, quantity = 1)
    unless products.key? product.id
      raise GrapeParamError.new(
        name: 'product',
        code: 'not_in_cart'
      )
    end
    if products[product.id].quantity == quantity
      products.delete(product.id)
    else
      products[product.id].quantity -= quantity
    end
  end

  def total_sum
    products.values.map(&:sum).sum
  end

  def products_count
    products.values.map(&:quantity).sum
  end

  def to_hash
    {
      total_sum: total_sum,
      products_count: products_count,
      products: products.values.map(&:to_hash)
    }
  end
end
