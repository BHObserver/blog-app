require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  # Validation tests
  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = FactoryBot.build(:user, posts_counter: -1)
    expect(user).not_to be_valid
  end

  it 'is valid with a non-negative posts_counter' do
    user = FactoryBot.build(:user, name: 'John Doe', posts_counter: 0)
    expect(user).to be_valid
  end

  # Method Test
  describe 'custom methods' do
    it 'returns three most recent posts' do
      FactoryBot.create_list(:post, 0, author: user)
      recent_posts = FactoryBot.create_list(:post, 0, author: user, created_at: 1.day.ago)

      expect(user.recent_posts).to eq(recent_posts.reverse)
    end

    it 'updates posts_counter after save' do
      expect(user.posts_counter).to eq(0)

      FactoryBot.create(:post, author: user)
      user.reload

      expect(user.posts_counter).to eq(1)
    end

    it 'returns five most recent comments' do
      post = FactoryBot.create(:post, author: user)
      FactoryBot.create_list(:comment, 7, user:, post:, created_at: 2.days.ago)
      recent_comments = FactoryBot.create_list(:comment, 5, user:, post:)

      expect(user.recent_comments).to eq(recent_comments.reverse)
    end

    it 'updates likes_counter after save' do
      post = FactoryBot.create(:post, author: user)
      expect(post.likes_counter).to eq(0)

      FactoryBot.create(:like, user:, post:)
      post.reload

      expect(post.likes_counter).to eq(0)
    end
  end
end
