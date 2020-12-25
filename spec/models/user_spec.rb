require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nickname、email、passwordとpassword_confirmation,first_nameとlast_name、first_name_kanaとlast_name_kana、birth_dateが存在すれば登録できる" do 
      expect(@user).to be_valid
    end
  

    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない"do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない"do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_name_kanaが空だと登録できない"do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it"last_name_kanaが空だと登録できない"do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "birth_dateが空だと登録できない"do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it "passwordとpassword_confirmationが一致しない場合は登録できない" do
      @user.password = "123efs"
      @user.password_confirmation = "123efe"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが全半角英数、場合は登録できない"do
      @user.password = "ｄｄｄｄdd"
      @user.password_confirmation = "ｄｄｄｄdd"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password is invalid")
    end
    it "passwordとpassword_confirmationが漢字場合は登録できない"do
      @user.password = "山田ー金太郎"
      @user.password_confirmation = "山田ー金太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_confirmationがカタカナ場合は登録できない"do
      @user.password = "ヤマダーキンタロウ"
      @user.password_confirmation = "ヤマダーキンタロウ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_confirmationが全半角数字だけ場合は登録できない"do
      @user.password = "1２３456"
      @user.password_confirmation = "1２３456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "emailに@がないと登録できない"do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "123ef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "first_nameとlast_nameが全半角英数だと登録できない"do
      @user.first_name = "Tt2３４"
      @user.last_name = " Tt2３４"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end
    it "first_name_kanaとlast_name_kanaが全半角英数だと登録できない"do
      @user.first_name_kana = "Tt2３４"
      @user.last_name_kana = " Tt2３４"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end
    it "first_name_kanaとlast_name_kanaが漢字だと登録できない"do
      @user.first_name_kana = "山田"
      @user.last_name_kana = "太郎 "
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end

  
    
  end
end
