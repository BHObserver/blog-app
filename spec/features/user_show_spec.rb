require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  let(:user) { create(:user, bio: 'This is a test bio') }
  let!(:posts) { create_list(:post, 3, user: user) }

  before do
    visit user_path(user)
  end



  scenario 'redirects to post show page when clicking a post' do
    post = posts.first
    click_link post.title
    expect(current_path).to eq(user_post_path(user, post))
  end

  scenario 'redirects to user posts index when clicking "See all posts"' do
    click_link 'See all posts 📝'
    expect(current_path).to eq(user_posts_path(user))
  end
end
