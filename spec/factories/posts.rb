FactoryBot.define do
  factory :post do
    association :author, factory: :user
    sequence(:title) { |n| "Post Title #{n}" }
    text { 'This is the post content.' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
