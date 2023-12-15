class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Custom method: Returns the 3 most recent posts for a given user
  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  # Custom method: Updates the posts counter for a user
  def update_user_posts_counter
    user.update(post_counter: user.posts.count)
  end

  # Custom method: Returns the 5 most recent comments for a given post
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  # Custom method: Updates the likes counter for a post
  def update_post_likes_counter
    update(likes_counter: likes.count)
  end


  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
