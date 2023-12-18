class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  attribute :file, :string

  validates :caption, :file, presence: true
end
