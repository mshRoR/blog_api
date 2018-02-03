# app/controllers/concerns/authenticates/authorize_api_request.rb
module Authenticates
  class AuthorizeApiRequest
    def initialize(headers = {})
      @headers = headers
    end

    def call
      check_token
    end

    private

    attr_reader :headers

    def check_token
      return auth_token_valid if headers[:Authorization].present?
      { base: { error: 'Access token is missing' }, status: :bad_request }
    end

    def auth_token_valid
      token = AuthToken.find_by(token: headers[:Authorization].split(' ').last) rescue nil
      check = !token.nil? && (Time.zone.now - token.created_at < 24.hours)

      return get_user(token.public_key) if check
      { base: { error: 'Access token invalid' }, status: :bad_request }
    end

    def get_user(public_key)
      token_decode = JsonWebToken.decode(headers[:Authorization].split(' ').last, public_key)
      user = User.find(token_decode[:id])

      { user: user }
    end
  end
end
