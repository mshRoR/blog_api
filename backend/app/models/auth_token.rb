# app/models/auth_token.rb
class AuthToken < ApplicationRecord
  validates :token, presence: true, uniqueness: true
  validates :public_key, presence: true, uniqueness: true
end
