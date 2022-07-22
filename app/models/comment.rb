class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text, presence: true, length: { minimum: 3, maximum: 255 }
  def update_comment_counter
    post.comments_counter = 0 if post.comments_counter.nil?
    post.increment!(:comments_counter)
  end
end
