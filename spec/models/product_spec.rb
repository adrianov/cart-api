require 'rails_helper'

describe Product, type: :model do
  describe '.all' do
    it 'returns 2 elements' do
      expect(Product.all.count).to eq(2)
    end
  end
end
