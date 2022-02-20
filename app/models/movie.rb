class Movie < ApplicationRecord
  has_many_attached :eyecatch

  belongs_to :user
end
