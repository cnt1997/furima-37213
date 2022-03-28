require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録できるとき" do
      it "nickname,email,password,password_confirmation,familyname,firstname,
    familyname_katakana,firstname_katakana,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
      end
    end
  end

    context '新規登録できないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスが空では登録できない" do 
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "既に登録されているメールアドレスは登録できない" do 
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスが@を含まなければ登録できない" do 
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが空では登録できない" do 
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが５文字以下だと登録できない" do 
        @user.password = Faker::Internet.password(max_length: 1,min_length: 5)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードに半角英数字が含まれていなければ登録できない" do 
        @user.password = "aaaaaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do 
        @user.password = "7777777"
        @user.password_confirmation = "666666"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "名字(全角)が空では登録できない" do 
        @user.familyname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname can't be blank")
      end

      it "名前(全角）が空では登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it "名字(全角）が全角入力でなければ入力できない" do 
        @user.familyname = "dddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname is invalid")
      end

      it "名前(全角）が全角入力でなければ入力できない" do 
        @user.firstname = "gggggggg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end

      it "名字(カタカナ)が空では登録できない" do 
        @user.familyname_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname katakana can't be blank", "Familyname katakana is invalid")
      end

      it "名前(カタカナ）が空では登録できない" do
        @user.firstname_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank", "Firstname katakana is invalid")
      end

      it "名字(カナ）は全角（カナ）でなければ登録できない" do
        @user.familyname_katakana = "dddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname katakana is invalid")

      end

      it "名前(カナ）は全角（カナ）でなければ登録できない" do
        @user.firstname_katakana = "gggggggg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana is invalid")
      end

      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
end
