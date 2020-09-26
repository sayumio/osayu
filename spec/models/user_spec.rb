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
        user = FactoryBot.build(:user)
        user.nickname = ""
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        user = FactoryBot.build(:user)
        user.email = ""
        user.valid?
        expect(user.errors.full_messages).to include("email can't be blank")
      end

      it "パスワードが空では登録できない" do
        user = FactoryBot.build(:user)
        user.password = ""
        user.valid?
        expect(user.errors.full_messages).to include("password can't be blank")
      end

      it "パスワードの確認が空では登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = ""
        user.valid?
        expect(user.errors.full_messages).to include("password_confirmation can't be blank")
      end

      it "パスワードの確認がパスワードと違うと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = "abcdoooo"
        user.valid?
        expect(user.errors.full_messages).to include("password_confirmation can't be blank")
      end

      it "seiが空では登録できない"do
        user = FactoryBot.build(:user)
        user.sei = ""
        user.valid?
        expect(user.errors.full_messages).to include("sei can't be blank")
      end

      it "meiが空では登録できない"do
        user = FactoryBot.build(:user)
        user.mei = ""
        user.valid?
        expect(user.errors.full_messages).to include("mei can't be blank")
      end

      it "kanaseiが空では登録できない"do
        user = FactoryBot.build(:user)
        user.kansei = ""
        user.valid?
        expect(user.errors.full_messages).to include("kanasei can't be blank")
      end

      it "kanameiが空では登録できない"do
        user = FactoryBot.build(:user)
        user.kanamei = ""
        user.valid?
        expect(user.errors.full_messages).to include("kanamei can't be blank")
      end

      it "bitrhdayが空では登録できない"do
        user = FactoryBot.build(:user)
        user.birthday = ""
        user.valid?
        expect(user.errors.full_messages).to include("birthday can't be blank")
      end

      it "メールアドレスに＠がないと登録できない"do
        user = FactoryBot.build(:user)
        user.email = "kkkgmail.com"
        user.valid?
      end

      it "パスワードが6文字以下では登録できない"do
        user = FactoryBot.build(:user)
        user.password = "abc00"
        user.valid?
      end

      it "パスワードが半角英数字混合でないと登録できない"do
        user = FactoryBot.build(:user)
        user.password = "abcdefg"
        user.valid?
      end

      it "ユーザー本名は全角で入力でないと登録できない"do
        user = FactoryBot.build(:user)
        user.sei = "ﾔﾏﾀﾞ"
        user.valid?
      end

      it "ユーザー本名のフリガナはカタカナでないと登録できない"do
        user = FactoryBot.build(:user)
        user.kanasei = "やまだ"
        user.valid?
      end
    end
  end
end