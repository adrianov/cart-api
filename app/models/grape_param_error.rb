# Format validation errors
class GrapeParamError < StandardError
  FULL_ERRORS = {
    required: 'cannot be blank',
    blank: 'cannot be blank',
    invalid: 'is invalid',
    not_found: 'is not found',
    not_in_cart: 'is not in the cart'
  }.freeze

  attr_accessor :name, :code, :message

  def initialize(params)
    self.name = params[:name]
    self.code = params[:code]
    self.message = params[:message]
  end

  def error
    full_error = FULL_ERRORS.key?(code.to_sym) ? FULL_ERRORS[code.to_sym] : code

    {
      params: [{
        name: name,
        code: code,
        message: "#{name.titleize} #{full_error}."
      }],
      type: 'invalid_param_error',
      message: 'Invalid data parameters'
    }
  end
end
