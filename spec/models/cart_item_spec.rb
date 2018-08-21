require 'rails_helper'

describe CartItem, type: :model do
  describe '.sum' do
    it 'summarizes product price' do
      item = CartItem.new(product: Product.find(1), quantity: 3)
      expect(item.sum).to eq 150
    end
  end

  describe '.to_json' do
    it 'returns proper JSON structure' do
      item = CartItem.new(product: Product.find(1), quantity: 3)
      expect(item.to_json).to eq(
        {
          id: 1,
          quantity: 3,
          sum: 150
        }.to_json
      )
    end
  end
end
