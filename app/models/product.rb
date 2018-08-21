# Product list
class Product
  attr_accessor :id, :name, :description, :price

  def initialize(params)
    self.id = params[:id].to_i
    self.name = params[:name].to_s
    self.description = params[:description].to_s
    self.price = params[:price].to_i
  end

  def self.all
    @all ||= [
      Product.new(
        "id": '1',
        "name": 'Product #1',
        "description": 'Product Description',
        "price": '50'
      ),
      Product.new(
        "id": '2',
        "name": 'Product #2',
        "description": 'Product Description',
        "price": '150'
      )
    ]
  end

  def self.find(id)
    all.detect { |product| product.id == id }
  end
end
