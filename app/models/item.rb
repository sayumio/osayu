class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, :comment, :price, :user_id, presence: true

  validates :category_id, :status_id, :charges_id, :area_id, :days_id, numericality: { other_than: 1 }

end