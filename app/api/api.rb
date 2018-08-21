# Application API
class Api < Grape::API
  content_type :json, 'application/json'
  content_type :txt, 'text/plain'

  format :json
  FULL_ERRORS = {
    required: 'cannot be blank',
    blank: 'cannot be blank',
    invalid: 'is invalid'
  }.freeze

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    messages = e.errors.map do |attributes, errors|
      code = errors.join
      full_error = FULL_ERRORS.key?(code.to_sym) ? FULL_ERRORS[code.to_sym] : code

      {
        name: attributes.join,
        code: code,
        message: "#{attributes.join.titleize} #{full_error}."
      }
    end

    error!(
      {
        error: {
          params: messages,
          type: 'invalid_param_error',
          message: 'Invalid data parameters'
        }
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
end
