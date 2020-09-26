require 'rails_helper'
RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nickname,email、passwordとpassword_confirmation、sei,mei,kanasei,kanamei,birthdayが存在すれば登録できる" do
          expect(@user).to be_valid
        end

        it "passwordが6文字以上で登録できる" do
          @user.password = "abc0000"
          expect(@user).to be_valid
        end
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワードの確認が空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "パスワードの確認がパスワードと違うと登録できない" do
        @user.password_confirmation = "abcd0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "seiが空では登録できない"do
        @user.sei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it "meiが空では登録できない"do
        @user.mei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end

      it "kanaseiが空では登録できない"do
        @user.kanasei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end

      it "kanameiが空では登録できない"do
        @user.kanamei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end

      it "bitrhdayが空では登録できない"do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it "メールアドレスに＠がないと登録できない"do
        @user.email = "kkkgmail.com"
        @user.valid?
      end

      it "パスワードが6文字以下では登録できない"do
        @user.password = "abc00"
        @user.valid?
      end

      it "パスワードが半角英数字混合でないと登録できない"do
        @user.password = "abcdefg"
        @user.valid?
      end

      it "ユーザー本名は全角で入力でないと登録できない"do
        @user.sei = "ﾔﾏﾀﾞ"
        @user.valid?
      end

      it "ユーザー本名のフリガナはカタカナでないと登録できない"do
        @user.kanasei = "やまだ"
        @user.valid?
      end
    end
  end
end