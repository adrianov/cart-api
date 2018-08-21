# Application API
class Api < Grape::API
  format :json
  # rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound
end
