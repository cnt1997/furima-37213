require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'item_name,description,category_id,status_id,delivery_charge_id,days_up_to_delivery_id,
      price,user,prefecture_id,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it "item_nameが空では登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "descriptionが空では登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "category_idが1の時は登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status can't be blank")
      end

      it "status_idが1では登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "delivery_charge_idが空では登録できない" do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "delivery_charge_idが1では登録できない" do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "days_up_to_deliveryが空では登録できない" do
        @item.days_up_to_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days up to delivery can't be blank", "Days up to delivery can't be blank")
      end

      it "days_up_to_deliveryが1では登録できない" do
        @item.days_up_to_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days up to delivery can't be blank")
      end

      it "priceが300未満では登録できない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが10,000,000以上では登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceが全角では登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
      end

      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end
