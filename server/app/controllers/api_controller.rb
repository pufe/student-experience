class ApiController < ActionController::Base
  protect_from_forgery with: :null_session

  def error(number, message)
    render json: {status: number, error_message: message}
  end

  def error_404
    error(404, 'Resource not found')
  end

  def success(object)
    render json: {status: 200, response: object}
  end
end
