class Movie < ApplicationRecord
  has_many_attached :eyecatch
  has_many :comments, dependent: :destroy
  has_many :spoilers, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user
  
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :entertainment, presence: true
  validates :genre, presence: true

end
