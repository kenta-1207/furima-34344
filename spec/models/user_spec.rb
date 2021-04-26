require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録出来るとき' do

      it 'nicknameとemail、passwordとpassword_confirmation,last_name,first_name,last_name_ruby_,first_name_ruby,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以で半角英数混合であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end

      it 'last_nameが全角であれば登録できる' do
        @user.last_name = 'あああ'
        expect(@user).to be_valid
      end

      it 'first_nameが全角であれば登録できる' do
        @user.first_name = 'あああ'
        expect(@user).to be_valid
      end

      it 'last_name_rubyが全角カナであれば登録できる' do
        @user.last_name_ruby = 'ア'
        expect(@user).to be_valid
      end

      it 'first_name_rubyが全角カナであれば登録できる' do
        @user.first_name_ruby = 'ア'
        expect(@user).to be_valid
      end

    end

    context '新規登録出来ないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "000"
        @user.password_confirmation = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_rubyが空では登録出来ない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end

      it 'first_name_rubyが空では登録出来ない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it 'birthdayが空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "emailに@がないと登録できない" do
        @user.email = "testgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it 'passwordが5文字以下では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'last_name_rubyがカタカナでないと登録出来ないこと' do
        @user.last_name_ruby = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby is invalid')
      end

      it 'first_name_rubyがカタカナ出ないと登録出来ないこと' do
        @user.first_name_ruby = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby is invalid')
      end
    end
  end
end
