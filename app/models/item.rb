class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, :comment, :category_id, :status_id, :charges_id, :area_id, :dats_id, :price, :user_id, presence: true

  validates :category_id, numericality: { other_than: 1 }
end
