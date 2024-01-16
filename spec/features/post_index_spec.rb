require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  before :each do
    @user1 = User.create!(id: 1, name: 'David', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          posts_counter: 1)
    @post1 = Post.create!(id: 1, author_id: @user1.id, title: 'First Post', text: 'First text', comments_counter: 2,
                          likes_counter: 1)
    @post2 = Post.create!(id: 2, author_id: @user1.id, title: 'Second Post', text: 'Second text', comments_counter: 2,
                          likes_counter: 1)
    @comment1 = Comment.create!(id: 1, user_id: @user1.id, post_id: @post1.id, text: 'Hello David!')
    @comment2 = Comment.create!(id: 2, post_id: @post2.id, user_id: @user1.id, text: 'Hello Ron!')
    @like1 = Like.create!(id: 1, post_id: @post1.id, user_id: @user1.id)
  end

  describe 'Index page' do
    it "should display the user's profile picture" do
      visit user_posts_path(@user1)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/1.jpg']")
    end
    it "should display the user's username" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.name)
    end
    it "should display the user's number of posts" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.posts_counter)
    end
    it "should display the post's title" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.title)
    end

    it "should display some of the post's body" do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.text)
    end
    it 'should display posts count' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.posts.count)
    end
    it 'should display the first comments on a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
    it 'should display the number of comments on a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.comments_counter)
    end
    it 'should display the number of likes on a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.likes_counter)
    end
    it 'Should display the section to create a new post' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Create New Post')
    end
    it 'Should redirects to post show page when clicked' do
      visit user_posts_path(@user1)
      click_link @post1.title
      expect(current_path).to eq(user_post_path(@user1, @post1))
    end
  end
end
