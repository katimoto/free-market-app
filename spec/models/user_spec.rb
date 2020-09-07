require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、、passwordとpassword_confirmation、first_name/last_name、f_kana/l_kana、birthdateが存在していれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "test123"
        @user.password_confirmation = "test123"
        expect(@user).to be_valid
      end
      it "メールアドレスは@を含んでいる" do
        @user.email = "test@gmail.com"
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合である" do
        @user.password = "test123"
        expect(@user).to be_valid
      end
      it "first_nameが全角漢字である" do
        @user.first_name = "ひで宏"
        expect(@user).to be_valid
      end
      it "last_nameが全角漢字である" do
        @user.last_name = "あい原"
        expect(@user).to be_valid
      end
      it "f_kanaが全角カナである" do
        @user.f_kana = "ヒデヒロ"
        expect(@user).to be_valid
      end
      it "l_kanaが全角カナである" do
        @user.l_kana = "アイハラ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは@を含んでいないと登録できない" do
        @user.email = "test.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do

      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない(take1)" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英数字混合でないと登録できない(take2)" do
        @user.password = "abcdef"
        @user.password_confirmation = "abedef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角漢字でないと登録できない" do
        @user.first_name = "hidehiro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角漢字でないと登録できない" do
        @user.last_name = "aihara"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "f_kanaが空では登録できない" do
        @user.f_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("F kana can't be blank")
      end
      it "f_kanaが全角カナでないと登録できない" do
        @user.f_kana = "ひで宏"
        @user.valid?
        expect(@user.errors.full_messages).to include("F kana 全角カナを使用してください")
      end
      it "l_kanaが空では登録できない" do
        @user.l_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("L kana can't be blank")
      end
      it "l_kanaが全角カナでないと登録できない" do
        @user.f_kana = "あい原"
        @user.valid?
        expect(@user.errors.full_messages).to include("F kana 全角カナを使用してください")
      end
      it "birthdateが空では登録できない" do
        @user.birthdate = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end