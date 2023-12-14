class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, foreign_key: 'user_id'
end
