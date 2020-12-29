require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品が成功した場合の処理' do
    context  '出品が成功したとき' do
     it "name、text、price、category_id 、status_id、shipping_fee_id、prefecture_id 、scheduled_delivery_id、imageが存在すれば登録できる" do
        expect(@item).to be_valid
     end
    end
    context '出品に失敗した場合の処理' do
     it "nameが空では登録できない" do
       @item.name = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it "textが空では登録できない" do
       @item.text = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Text can't be blank")
     end
     it "priceが空では登録できない" do
       @item.price = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it "category_idが空では登録できない" do
       @item.category_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it "status_idが空だと登録できない"do
       @item.status_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Status can't be blank")
     end
     it "shipping_fee_idが空だと登録できない"do
       @item.shipping_fee_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
     end
     it "prefecture_idが空だと登録できない"do
       @item.prefecture_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end
     it"scheduled_delivery_idが空だと登録できない"do
       @item.scheduled_delivery_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
     end
     it "imageが空だと登録できない"do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it "priceの範囲が、¥299以下場合は登録できない" do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than 299")
     end
     it "priceの範囲が、¥10,000,000場合は登録できない"do
       @item.price = 10000000
       @item.valid?
       expect(@item.errors.full_messages).to include( "Price must be less than 10000000")
     end
     it "priceが全角数字場合は登録できない"do
       @item.price = "９９９９９９９"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it "priceが全半角英場合は登録できない"do
       @item.price = "wｗｓEｓ"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it "priceがカタカナ、ひらがな場合は登録できない"do
       @item.price = "カタカナひらがな"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
     end


     it "priceが漢字の場合は登録できない"do
       @item.price = "漢字"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it "category_id,が1の場合は登録できない"do
       @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
     end
     it "status_id,が1の場合は登録できない"do
       @item.status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Status must be other than 1")
     end
     it "shipping_fee_id,が1の場合は登録できない"do
       @item.shipping_fee_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
     end
     it "prefecture_id,が1の場合は登録できない"do
       @item.prefecture_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     end
     it "scheduled_delivery_id,が1の場合は登録できない"do
       @item.scheduled_delivery_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
     end
    end
  end
end
