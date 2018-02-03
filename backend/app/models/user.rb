#=============== Model columns Name & Data type ===============#
# name:string
# email:string
# username:string, null: false
# password_digest:string, null: false
# role:integer, null: false, default: 0
# is_active:boolean, null: false, default: true
#==============================================================#
class User < ApplicationRecord
  has_secure_password
  enum role: { admin: 1,
               modarator: 2,
               general: 3 }

  validates :name, presence: true
  validates :email, format: { allow_blank: true,
                              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { allow_blank: true, case_sensitive: false }
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z0-9_\.]*$\z/i },
                       uniqueness: true
  validates :password, presence: { on: :create },
                       length: { minimum: 8, allow_blank: true }
  validates :role, presence: true
end
