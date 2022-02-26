class Comment < ApplicationRecord
  belongs_to :movie
  validates :feelings, presence: true
end
