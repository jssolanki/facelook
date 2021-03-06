class Post < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :comments
  belongs_to :user
  validates :content, length: { minimum: 10}
end
