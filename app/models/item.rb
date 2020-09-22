class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_scheduled_delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  with_options numericality: {other_than: 0, message:'Select' } do
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end
end