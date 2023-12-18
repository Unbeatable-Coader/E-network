class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :posts
        has_one :user_detail, dependent: :destroy
        has_one_attached :image
        attribute :image, :string
end
