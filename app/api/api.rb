# Application API
class Api < Grape::API
  content_type :json, 'application/json'
  content_type :txt, 'text/plain'

  format :json

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    e.errors.each do |attributes, errors|
      break error!(
        {
          error: GrapeParamError.new(
            name: attributes.join,
            code: errors.join
          ).error
        },
        400
      )
    end
  end

  rescue_from GrapeParamError do |e|
    error!(
      {
        error: e.error
      },
      400
    )
  end

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

    # Return Cart
    get do
      cart
    end

    # Add Product to Cart
    params do
      requires :product_id,
               type: { value: Integer, message: 'invalid' },
               message: 'required',
               allow_blank: { value: false, message: 'blank' }
      optional :quantity,
               type: { value: Integer, message: 'invalid' },
               default: 1,
               allow_blank: { value: false, message: 'blank' }
    end
    post do
      cart.add_product!(product, params[:quantity])
      content_type 'text/plain'
      body ''
    end

    # Remove Product from Cart
    route_param :product_id, type: { value: Integer, message: 'invalid' } do
      delete do
        cart.remove_product!(product)
        content_type 'text/plain'
        body ''
      end
    end
  end

  route :any, '*path' do
    error!(
      error: {
        type: 'invalid_request_error',
        message: "Unable to resolve the request \"#{request.path}\"."
      }
    )
  end
end
