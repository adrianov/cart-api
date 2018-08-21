require 'rails_helper'

describe Cart, type: :model do
  describe '.add_product!' do
    it 'adds product to Cart' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      expect(cart.products[1][:quantity]).to eq(1)
    end
  end

  describe '.remove_product!' do
    it 'removes product from Cart' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      cart.remove_product!(Product.find(1), 1)
      expect(cart.products[1][:quantity]).to eq(0)
    end
  end

  describe '.total_sum' do
    it 'counts total sum for added Products' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      cart.add_product!(Product.find(2), 2)
      expect(cart.total_sum).to eq(350)
    end
  end
end
