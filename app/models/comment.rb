class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text, presence: true, length: { minimum: 3, maximum: 255 }

  after_save :update_comment_counter
  after_destroy :decrement_comment_counter
 
  def update_comment_counter
    post.increment!(:comments_counter)
  end

  def decrement_comment_counter
    post.decrement!(:comments_counter)
  end
end
