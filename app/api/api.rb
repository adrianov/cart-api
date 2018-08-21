# Application API
class Api < Grape::API
  format :json
  # rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound

  resources :products do
    # Get all Products
    get do
      present :data, Product.all
    end
  end
end
