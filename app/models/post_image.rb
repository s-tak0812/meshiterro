class PostImage < ApplicationRecord

  #AvtiveStorageに投稿した画像を保存する設定
  has_one_attached :image

  validates :shop_name, presence: true
  validates :image, presence: true
  # (model) PostImage : User = N : 1の関連付け
  belongs_to :user

  # (model)PostImage : PostComment = 1 : Nの関連付け+destroy
  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end

end
