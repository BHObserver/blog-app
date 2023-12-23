# spec/factories.rb
FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'https://example.com/photo.jpg' }
    bio { 'A user bio' }

    posts_counter { 0 }
  end
end
