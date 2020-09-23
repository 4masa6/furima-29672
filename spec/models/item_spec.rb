require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品登録がうまくいくとき' do
      it "image、item_name、item_info、item_category_id、item_sales_status_id、item_shipping_fee_status_id、item_prefecture_id、item_scheduled_delivery_id、item_priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_infoが空では登録できない" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "item_category_idを選択しなければ登録できない" do
        @item.item_category_id = "０"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category Select")
      end
      it "item_sales_status_idを選択しなければ登録できない" do
        @item.item_sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status Select")
      end
      it "item_shipping_fee_status_idを選択しなければ登録できない" do
        @item.item_shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status Select")
      end
      it "item_prefecture_idを選択しなければ登録できない" do
        @item.item_prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture Select")
      end
      it "item_scheduled_delivery_idを選択しなければ登録できない" do
        @item.item_scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery Select")
      end
      it "item_priceが空だと登録できない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it "item_priceが半角数字でないと登録できない" do
        @item.item_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it "item_priceが300円以上でないと登録できない" do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it "item_priceが9999999円以下でないと登録できない" do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
    end
  end
end
