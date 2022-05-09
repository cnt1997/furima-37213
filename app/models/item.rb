class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
  validates :price,                     presence: true,   numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9999999}
  validates :prefecture_id,             presence: true,   numericality: { other_than: 1, message: "can't be blank"}
  validates :image,                     presence: true

  belongs_to :user
  has_one :order
  has_one_attached :image
end
