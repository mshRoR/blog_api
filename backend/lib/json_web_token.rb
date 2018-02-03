# lib/json_web_token.rb
class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      rsa_private = OpenSSL::PKey::RSA.generate 2048
      rsa_public = rsa_private.public_key
      token = JWT.encode payload, rsa_private, 'RS256'

      { token: token, public_key: rsa_public }
    end

    def decode(token, rsa_public)
      rsa_public = OpenSSL::PKey::RSA.new(rsa_public)
      payload, header = JWT.decode token, rsa_public, true, { :algorithm => 'RS256' }
      HashWithIndifferentAccess.new(payload)
    rescue
      nil
    end
  end
end
