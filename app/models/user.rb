class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
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
  
   # User::Roles
      # The available roles
  Roles = [ :admin , :default ]
  def is?( requested_role )
    self.role == requested_role.to_s
  end

end
