class User < ApplicationRecord
  validates :name ,presence:true,length:{maximum:15}
  validates :email,presence:true,format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,32}\z/
  validates :password,format:{with:VALID_PASSWORD_REGEX}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
