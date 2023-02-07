class PostImage < ApplicationRecord
  has_one_attached :image
  # (model) PostImage : User = N : 1の関連付け
  belongs_to :user
end
