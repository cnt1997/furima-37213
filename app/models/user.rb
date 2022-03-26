class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,           presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/}
  validates :nickname,           presence: true 
  validates :familyname,         presence: true
  validates :firstname,          presence: true
  validates :familyname_katakana,presence: true
  validates :firstname_katakana, presence: true
  validates :birthday,           presence: true
end
