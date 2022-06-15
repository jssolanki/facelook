class Post < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }
  belongs_to :user
  validates :content, length: { minimum: 10}
end
