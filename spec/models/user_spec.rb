require 'rails_helper'

RSpec.describe User, type: :model do
  before do
       @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
   it '全ての項目の入力が存在すれば登録できる' do
        expect(@user).to be_valid
   end
  end
  context '新規登録できないとき' do
   it 'nick_nameが空では登録できない' do
       @user.nick_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nick name can't be blank")
   end
   it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it 'passwordが半角数字のみのときに登録できない' do
       @user.password = '123456'
       @user.password_confirmation = '123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
   end
   it 'passwordが半角英語のみのときに登録できない' do
       @user.password = 'abcdef'
       @user.password_confirmation = 'abcdef'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
   end
   it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
   end
   it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password = '123456'
       @user.password_confirmation = '1234567'
       @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it 'family_nameが空では登録できない' do
       @user.family_name = ''
       expect(@user).not_to be_valid
   end
   it 'first_nameが空では登録できない' do
       @user.first_name = ''
       expect(@user).not_to be_valid
   end
   it 'family_name_kanaが空では登録できない' do
       @user.family_name_kana = ''
       expect(@user).not_to be_valid
   end
   it 'first_name_kanaが空では登録できない' do
       @user.first_name_kana = ''
       expect(@user).not_to be_valid
   end
   it 'birthが空では登録できない' do
       @user.birth = ''
       expect(@user).not_to be_valid
   end
   it '重複したemailが存在する場合は登録できない' do
       @user.save
       @another_user = FactoryBot.build(:user)
       @another_user.email = @user.email
       @another_user.valid?
       expect(@another_user.errors.full_messages).to include('Email has already been taken')
   end
   it 'emailは@を含まないと登録できない' do
       @user.email = 'testmail'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
   end
   it 'passwordが5文字以下では登録できない' do
       @user.password = '00000'
       @user.password_confirmation = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
   end
   it 'passwordが129文字以上では登録できない' do
       @user.password = Faker::Internet.password(min_length: 129)
       @user.password_confirmation = @user.password
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
   end
   it '全角文字を含むパスワードでは登録できない' do
       @user.password = 'パスワード１２３４５'
       expect(@user).not_to be_valid
   end
   it 'family_nameが全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
       @user.family_name = 'Smith'
       expect(@user).not_to be_valid
   end
   it 'first_nameが全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
       @user.first_name = 'John'
       expect(@user).not_to be_valid
   end
   it 'family_name_kanaが全角（カタカナ）での入力でないと登録できない' do
       @user.family_name_kana = 'すみす'
       expect(@user).not_to be_valid
   end
   it 'first_name_kanaが全角（カタカナ）での入力でないと登録できない' do
       @user.first_name_kana = 'たろう'
       expect(@user).not_to be_valid
   end
  end
 end
end