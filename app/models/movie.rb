class Movie < ApplicationRecord
  has_many_attached :eyecatch
  has_many :comments, dependent: :destroy
  has_many :spoilers, dependent: :destroy

  belongs_to :user
end
