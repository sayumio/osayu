class Item < ApplicationRecord
  validates :name, :comment, :category_id, :status_id, :charges_id, :area_id, :dats_id, :price, :user_id, presence: true
end
