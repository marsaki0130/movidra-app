class Drama < ApplicationRecord
  has_many_attached :eyecatch
  belongs_to :user
  has_many :comments
  has_many :likes
end
