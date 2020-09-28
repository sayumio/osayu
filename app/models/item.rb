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

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :comment, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :category_id
    validates :status_id
    validates :charges_id
    validates :area_id
    validates :days_id
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :charges_id
      validates :area_id
      validates :days_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
