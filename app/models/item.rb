class Item < ApplicationRecord
  validates :item_name,                 presence: true
  validates :description,               presence: true
  validates :category_id,               presence: true
  validates :status_id,                 presence: true
  validates :delivery_charge_id,        presence: true
  validates :days_up_to_delivery_id,    presence: true
  validates :price,                     presence: true
  validates :user,                      presence: true, foreign_key: true
  validates :prefecture_id,             presence: true

  belongs_to :user
  has_one_attached :image
end
