class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id, :status_id, :charges_id, :area_id, :days_id

  validates :name, :comment, :category_id, :status_id, :charges_id, :area_id, :days_id, :price, :user_id, presence: true

  validates :category_id, :status_id, :charges_id, :area_id, :days_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :purchase
  has_one_attached :image

end