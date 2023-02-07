class PostComment < ApplicationRecord

  #PostComment:User = N:1
  belongs_to :user

  #PostComment:PostImage = N:1
  belongs_to :post_image

end
