class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  has_many :schedulings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
end