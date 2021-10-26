class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend_with_user, class_name: 'User'
end
