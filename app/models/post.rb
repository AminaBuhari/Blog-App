class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter
  after_destroy :decrement_posts_counter

  def update_post_counter
    user.increment!(:post_counter)
  end

  def recent_comments
    comments.order!(created_at: :desc).limit(5)
  end

  def decrement_posts_counter
    user.decrement!(:posts_counter)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.decrement_posts_counter
    @post.delete
    redirect_to user_path(@post.user_id), notice: "Post deleted"
  end 

end
