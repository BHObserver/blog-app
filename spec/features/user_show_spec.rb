require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  let(:user) { create(:user, bio: 'This is a test bio') }
  let!(:posts) { create_list(:post, 3, user: user) }

  before do
    visit user_path(user)
  end

  scenario 'displays user information' do
    expect(page).to have_css("img[src*='#{user.profile_picture_url}']")
    expect(page).to have_content(user.username)
    expect(page).to have_content("Number of Posts: #{user.posts.count}")
    expect(page).to have_content('Bio:')
    expect(page).to have_content(user.bio)
  end

  scenario 'displays the first 3 posts' do
    posts.each_with_index do |post, index|
      within(".post:nth-of-type(#{index + 1})") do
        expect(page).to have_content("📝 Post #{index + 1}: #{post.title}")
        expect(page).to have_content(post.text)
        expect(page).to have_content("Comments: 💬 #{post.comments.count} | Likes: 👍 #{post.likes.count}")
      end
    end
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
