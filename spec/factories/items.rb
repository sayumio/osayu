FactoryBot.define do
  factory :item do
    name                { 'ほし' }
    comment             { 'ほしです' }
    category_id         { '2' }
    status_id           { '2' }
    charges_id          { '2' }
    area_id             { '2' }
    days_id             { '2' }
    price               { '5000' }
    association :user
  end
end
