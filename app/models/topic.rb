class Topic < ApplicationRecord
  validates :user_id,presence:true
  validates :description,presence:true
  validates :image,presence:true
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  mount_uploader :image, ImageUploader
  
  # ファイルサイズに制限をつける
  def size_range
    0..10.megabytes
  end
  
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_whitelist
    %w(jpg jpeg png)
  end

end
