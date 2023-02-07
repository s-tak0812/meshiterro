class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # (model)User : PostImage = 1 : Nの関連付け
  #及びuser削除の時に関連記事の削除指令
  has_many :post_images, dependent: :destroy


  # ActiveStorageにprofili_imageを保存する設定
  has_one_attached :profile_image

  # ----------------------↓-------↓---引数を渡すようにして各ページごとに画像サイズを変更可能にする
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), file_name: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
