# Group of identical Products in Cart
class CartItem
  attr_accessor :product, :quantity

  def initialize(params)
    self.product = params[:product]
    self.quantity = params[:quantity]
  end

  def sum
    product.price * quantity
  end

  def as_json(_options = {})
    {
      id: product.id,
      quantity: quantity,
      sum: sum
    }
  end
end
