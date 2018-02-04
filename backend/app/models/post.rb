#=============== Model columns Name & Data type ===============#
# user:references
# title:string
# description:string
#==============================================================#
class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts

  validates :title, presence: true,
                    length: { minimum: 5 },
                    uniqueness: true
  validates :description, presence: true
end
