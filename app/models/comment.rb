class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :drama
  validates :feelings, presence: true
  validates :star, presence: true
end
