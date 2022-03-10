class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :feelings, presence: true
  validates :star, presence: true
end
