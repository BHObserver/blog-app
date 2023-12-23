# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    association :user
    association :post
    text { 'This is a comment.' }

    trait :with_different_user do
      association :user, factory: :user
    end

    trait :with_different_post do
      association :post, factory: :post
    end
  end
end
