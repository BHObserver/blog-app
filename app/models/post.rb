class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Custom method: Updates the posts counter for a user
  def update_user_posts_counter
    user.update(post_counter: user.posts.count)
  end

  # Custom method: Returns the 5 most recent comments for a given post
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

end
