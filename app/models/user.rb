class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
