class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :profile, dependent: :destroy
  has_one_attached :avatar
  
  has_many :movie
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def has_liked(movie)
    likes.exists(movie_id: movie.id)
  end

  def like_count
    likes.count
  end

  def comment_count
    comments.count
  end
end
