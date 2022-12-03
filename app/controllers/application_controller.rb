class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_missing_params_error
  before_action :render_invalid_params_error, unless: :valid_params?

  private

  def render_missing_params_error
    render plain: "Bad request: missing params", status: 400
  end

  def render_invalid_params_error
    render plain: "Bad request: invalid params", status: 400
  end

  def valid_params?
    raise NotImplementedError
  end
end
