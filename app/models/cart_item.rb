# Group of identical Products in Cart
class CartItem
  attr_accessor :product
  attr_reader :quantity

  def initialize(params)
    self.product = params[:product]
    self.quantity = params[:quantity].to_i
  end

  def sum
    product.price * quantity
  end

  def quantity=(value)
    unless value.positive?
      raise GrapeParamError.new(
        name: 'quantity',
        code: 'invalid'
      )
    end
    @quantity = value
  end

  def to_hash
    {
      id: product.id,
      quantity: quantity,
      sum: sum
    }
  end
end
