require 'rails_helper'
RSpec.describe Credit, type: :model do
  before do
    buyer = FactoryBot.create(:user )
    seller = FactoryBot.create(:user )
    item = FactoryBot.create(:item, user_id: seller.id)
    @credit = FactoryBot.build(:credit, user_id: buyer.id, item_id: item.id )
  end

  describe '商品購入が成功した場合の処理' do
    context  '商品購入が成功したとき' do
      it "user_id、item_id、 postal_code、prefecture_id、city 、house_number、phone_number 、building_name、tokenが存在すれば登録できる" do
        expect(@credit.valid?).to eq true
      end
      it '建物名が空でも購入できること' do
        @credit.building_name = ""
        expect(@credit).to be_valid
      end
    end
    context '商品購入に失敗した場合の処理' do
      it "postal_codeが空では登録できない" do
       @credit.postal_code = ""
       @credit.valid?
       expect(@credit.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @credit.prefecture_id = 1
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空では登録できない" do
        @credit.city = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では登録できない" do
        @credit.house_number = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @credit.phone_number = ""
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Phone number can't be blank")
      end
      it "user_idが空では登録できない" do
        @credit.user_id = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できない" do
        @credit.item_id = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @credit.token = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @credit.postal_code = "1234567"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Postal code is invalid")
      end
      it "phone_numberが12桁以上では登録できない" do
        @credit.phone_number = "090123456789"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberが12桁以上では登録できない" do
        @credit.phone_number = "090123456789"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberが英数字混合では登録できない" do
        @credit.phone_number = "09012345aaa"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが漢字では登録できない" do
        @credit.phone_number = "090一二三45678"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberがひらがな、カタカナでは登録できない" do
        @credit.phone_number = "あイうエおええええええ"
        @credit.valid?
        
        expect(@credit.errors.full_messages).to include("Phone number is invalid")
      end
      it "postal_codeが英数字混合では登録できない" do
        @credit.postal_code = "123-awe"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeが漢字では登録できない" do
        @credit.postal_code = "123-一二三1"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeがひらがな、カタカナでは登録できない" do
        @credit.postal_code = "あイう-あイうえ"
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Postal code is invalid")
      end
    end
  end
end
