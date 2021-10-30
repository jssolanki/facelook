class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :posts, -> { order(created_at: :desc) }
  has_many :friends, class_name: 'Friend', foreign_key: 'user_id'
  has_many :friends_with, class_name: 'Friend', foreign_key: 'friend_with_user_id'
  has_many :likes, as: :likeable
  # validation start from here
  validates :first_name, presence: true
  validates :first_name, format: { with: /[a-zA-Z]+/, message: 'only allows letters' }
  validates :middle_name, presence: true
  validates :middle_name, format: { with: /[a-zA-Z]+/, message: 'only allows letters' }
  validates :last_name, presence: true
  validates :last_name, format: { with: /[a-zA-Z]+/, message: 'only allows letters' }
  validates :gender, presence: true
  validates :gender, inclusion: { in: %w[Male Female Transgender], message: "%{value} is not a valid" }
  # validates :date_of_birth, presence: true
  validates :relationship, inclusion: { in: %w[Married Single Live-In Complicated], message: "%{value} is not a valid" }
  validates :bio, length: { maximum: 150 }
  validates :emails, presence: true
end

# email uniqueness need to rethink
