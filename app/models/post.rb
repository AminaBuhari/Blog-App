class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    user.post_counter = 0 if user.post_counter.nil?
    user.increment!(:post_counter)
  end

  def recent_comments
    comments.order!(created_at: :desc).limit(5)
  end
end
