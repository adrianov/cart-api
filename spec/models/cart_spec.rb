require 'rails_helper'

describe Cart, type: :model do
  describe '.add_product!' do
    it 'adds product to Cart' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      expect(cart.products[1]).to eq(1)
    end
  end

  describe '.remove_product!' do
    it 'removes product from Cart' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      cart.remove_product!(Product.find(1), 1)
      expect(cart.products[1]).to eq(0)
    end
  end
end
