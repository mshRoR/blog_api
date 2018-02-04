# app/controllers/api/v1/authenticates_controller.rb
module Api::V1
  class AuthenticatesController < ApplicationController
    before_action :authenticate_request, except: %i[create]
    include CheckPermission

    # POST   /api/v1/authenticates/login
    def create
      result = Authenticates::Create.new(params).call

      json_response(result[:base], result[:status])
    end

    # DELETE /api/v1/authenticates/sign-out
    def destroy
      auth_token = request.headers['Authorization'].split(' ').last
      token = AuthToken.find_by(token: auth_token)
      token.destroy

      head :no_content
    end
  end
end
