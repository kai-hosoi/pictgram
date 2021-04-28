class User < ApplicationRecord
  validates :name ,presence:true,length:{maximum:15}
  validates :email,presence:true,format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  validates :password,length:{minimum:8,maximum:32},format:{with:VALID_PASSWORD_REGEX}
  
  has_secure_password
  
  has_many :topics
end
