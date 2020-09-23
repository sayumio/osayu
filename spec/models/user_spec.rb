require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
      user.valid?
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "タロウ", email: "", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
      user.valid?
    end

    it "パスワードが空では登録できない" do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "", password_confirmation: "", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "seiが空では登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
      user.valid?
    end

    it "meiが空では登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "kanaseiが空では登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "kanameiが空では登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "", birthday: "1990/01/01")
    user.valid?
    end

    it "bitrhdayが空では登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "")
    user.valid?
    end

    it "メールアドレスに＠がないと登録できない"do
    user = User.new(nickname: "タロウ", email: "kkkgmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "パスワードが6文字以下では登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "0000", password_confirmation: "0000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "パスワードが半角英数字混合でないと登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "ユーザー本名は全角で入力でないと登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "yamada", mei: "太郎", kanasei: "ヤマダ", kanamei: "タロウ", birthday: "1990/01/01")
    user.valid?
    end

    it "ユーザー本名のフリガナはカタカナでないと登録できない"do
    user = User.new(nickname: "タロウ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", sei: "山田", mei: "太郎", kanasei: "やまだ", kanamei: "たろう", birthday: "1990/01/01")
    user.valid?
    end
  end
end