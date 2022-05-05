class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true


  has_one :profile, dependent: :destroy
  has_one_attached :avatar
  
  has_many :movie,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorite_movies, through: :likes, source: :movie
  has_many :comments, dependent: :destroy
  has_many :spoilers, dependent: :destroy
  has_many :liked_timelines, through: :likes, source: :timeline

  def has_liked?(movie)
    likes.exists?(movie_id: movie.id)
  end

end
