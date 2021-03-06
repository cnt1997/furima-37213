class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ 
  VALID_KATAKANA = /\A[ァ-ヶー－]+\z/

  validates :password,           format: {with: VALID_PASSWORD}
  validates :nickname,           presence: true 
  validates :familyname,         presence: true, format: {with: VALID_NAME} 
  validates :firstname,          presence: true, format: {with: VALID_NAME}
  validates :familyname_katakana,presence: true, format: {with: VALID_KATAKANA}
  validates :firstname_katakana, presence: true, format: {with: VALID_KATAKANA}
  validates :birthday,           presence: true

  has_many :items
  has_many :orders
end
