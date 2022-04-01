class Item < ApplicationRecord
  extend ActiveHash::Associatons::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :days_up_to_delivery
  belongs_to :prefecture

  validates :item_name,                 presence: true
  validates :description,               presence: true
  validates :category_id,               presence: true,   numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id,                 presence: true,   numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id,        presence: true,   numericality: { other_than: 1, message: "can't be blank"}
  validates :days_up_to_delivery_id,    presence: true,   numericality: { other_than: 1, message: "can't be blank"}
  validates :price,                     presence: true
  validates :user,                      presence: true,   foreign_key: true
  validates :prefecture_id,             presence: true,   numericality: { other_than: 1, message: "can't be blank"}

  belongs_to :user
  has_one_attached :image
end
