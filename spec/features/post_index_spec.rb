require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  before :each do
    @user1 = User.create!(id: 1, name: 'David', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          posts_counter: 1)
    @post1 = Post.create!(id: 1, author_id: @user1.id, title: 'First Post', text: 'First text', comments_counter: 2,
                          likes_counter: 1)
    @post2 = Post.create!(id: 2, author_id: @user1.id, title: 'First Post', text: 'First text', comments_counter: 2,
                          likes_counter: 1)
    @comment1 = Comment.create!(id: 1, user_id: @user1.id, post_id: @post1.id, text: 'Hello David!')
    @comment2 = Comment.create!(id: 2, post_id: @post2.id, user_id: @user1.id, text: 'Hello Ron!')
    @like1 = Like.create!(id: 1, post_id: @post1.id, user_id: @user1.id)
  end
