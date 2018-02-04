# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  include JsonResponse

  private

  def authenticate_request
    result = Authenticates::AuthorizeApiRequest.new(request.headers).call

    return @current_user = result[:user] if result[:user].present?
    json_response(result[:base], result[:status])
  end
end
