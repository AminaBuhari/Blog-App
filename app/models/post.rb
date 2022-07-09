class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_post_counter

  private

  def update_post_counter
    user.increment!(:postscounter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
