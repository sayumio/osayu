class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
        validates :nickname
        validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
        validates :password, format: { with: /\A(?=.*?[a-zA-Z0-9])+{1,1}+\z/},length: { minimum: 6}
        validates :sei, format: { with: /\A[ぁ-んァ-ン一-龥]/}
        validates :mei, format: { with: /\A[ぁ-んァ-ン一-龥]/}
        validates :kanasei, format: { with: /\A[ァ-ヶー－]+\z/}
        validates :kanamei, format: { with: /\A[ァ-ヶー－]+\z/}
        validates :birthday
   end
end
