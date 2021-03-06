class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :order, :token


  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number,     format: {with: /\A[0-9]{10,11}\z/}
    validates :token
  end

  
  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する,order_idは、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end