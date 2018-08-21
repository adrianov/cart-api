require 'rails_helper'

describe Cart, type: :model do
  describe '.add_product!' do
    it 'adds product to Cart' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      expect(cart.products[1].quantity).to eq(1)
    end
  end

  describe '.remove_product!' do
    it 'removes product from Cart' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      cart.remove_product!(Product.find(1), 1)
      expect(cart.products[1].quantity).to eq(0)
    end
    it 'removes 1 product by default' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 2)
      cart.remove_product!(Product.find(1))
      expect(cart.products[1].quantity).to eq(1)
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

  describe '.products_count' do
    it 'counts Products' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      cart.add_product!(Product.find(2), 2)
      expect(cart.products_count).to eq(3)
    end
  end

  describe '.to_json' do
    it 'returns proper JSON structure' do
      cart = Cart.new
      cart.add_product!(Product.find(1), 1)
      cart.add_product!(Product.find(2), 2)
      expect(cart.to_json).to eq(
        {
          total_sum: 350,
          products_count: 3,
          products: [
            {
              id: 1,
              quantity: 1,
              sum: 50
            },
            {
              id: 2,
              quantity: 2,
              sum: 300
            }
          ]
        }.to_json
      )
    end
  end
end
