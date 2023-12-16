# spec/factories/likes.rb
FactoryBot.define do
  factory :like do
    association :user
    association :post

    trait :with_different_user do
      association :user, factory: :user
    end

    trait :with_different_post do
      association :post, factory: :post
    end
  end
end
