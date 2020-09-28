FactoryBot.define do
  factory :user do
    nickname              { 'タロウ' }
    email                 {'kkk@gmail.com'}
    password              {'abc0000'}
    password_confirmation {password}
    sei                   {'山田'}
    mei                   {'太郎'}
    kanasei               {'ヤマダ'}
    kanamei               {'タロウ'}
    birthday              {'1990/01/01'}
  end
end
