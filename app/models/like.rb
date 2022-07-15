class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    post.likes_counter = 0 if post.likes_counter.nil?
    post.increment!(:likes_counter)
  end
end
