# Application API
class Api < Grape::API
  format :json
  # rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound

  helpers do
    # Create persistent cart
    def cart
      @@cart ||= Cart.new
    end
  end

  resources :products do
    # Get all Products
    get do
      present :data, Product.all
    end
  end

  # Initialize persistent Cart
  resource :cart do
    params do
      requires :product_id, type: Integer
      optional :quantity, type: Integer, default: 1
    end

    # Add Product to Cart
    post do
      product = Product.find(params[:product_id])
      cart.add_product!(product, params[:quantity])
    end
  end
end
