class Movie < ApplicationRecord
  has_many_attached :eyecatch
  has_many :comments, dependent: :destroy

  belongs_to :user
end
