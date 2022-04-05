class Movie < ApplicationRecord

  has_many_attached :eyecatch
  has_many :comments,dependent: :destroy
  has_many :spoilers, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user
  
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :entertainment, presence: true
  validates :genre, presence: true

  def like_count
    likes.count
  end

  def avg_score
    unless self.comments.empty?
      comments.average(:star).
    else
      0.0
    end
  end

 def avg_score_percentage
   unless self.comments.empty?
     comments.average(:star).round(1).to_f*100/5
   else
     0.0
   end
 end

 #コメント件数
 def comment_count
  comments.count
 end

 #検索機能
  def self.search(search) 
    if search 
      Movie.where(['title LIKE ?', "%#{search}%"])
    else
      Movie.all 
    end
  end
end
