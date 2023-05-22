require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 130)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      it 'passwordは、英字のみでは登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが無効です。 文字と数字の両方を含める')
      end
      it 'passwordは、数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが無効です。 文字と数字の両方を含める')
      end
      it 'passwordは、全角文字を含むと登録できない' do
        @user.password = 'パスワード123'
        @user.password_confirmation = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが無効です。 文字と数字の両方を含める')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("姓を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("名を入力してください")
      end
      it 'family_nameは、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.family_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は全角文字を入力してください')
      end
      it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は全角文字を入力してください')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("姓(カタカナ)を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("名(カタカナ)を入力してください")
      end
      it 'family_nameは、全角カタカナでの入力でなければ登録できない' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓(カタカナ)全角カタカナを入力してください')
      end
      it 'first_name_kanaは、全角カタカナでの入力でなければ登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名(カタカナ)全角カタカナを入力してください')
      end
      it 'birthdayが入力されていないと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("誕生日を入力してください")
      end
    end
  end
end