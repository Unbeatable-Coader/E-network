class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :likes
        has_many :posts
        has_many :comments
        has_many :rooms
        has_many :messages
        has_one :user_detail, dependent: :destroy
        has_one_attached :image
        attribute :image, :string
        scope :all_except, ->(user) { where.not(id: user) }
        after_create_commit { broadcast_append_to "users" }
end
