class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def most_recent_three_posts
    posts.order!(created_at: :desc).limit(3)
  end
end
