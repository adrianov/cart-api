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
    helpers do
      def product
        @product ||= Product.find(params[:product_id])
      end
    end

    # Add Product to Cart
    params do
      requires :product_id, type: Integer
      optional :quantity, type: Integer, default: 1
    end
    post do
      cart.add_product!(product, params[:quantity])
    end

    # Remove Product from Cart
    route_param :product_id, type: Integer do
      delete do
        cart.remove_product!(product)
      end
    end
  end
end
