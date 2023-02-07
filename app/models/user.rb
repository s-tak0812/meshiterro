class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # (model)User : PostImage = 1 : Nの関連付け
  #及びuser削除の時に関連記事の削除指令
  has_many :post_images, dependent: :destroy
end
