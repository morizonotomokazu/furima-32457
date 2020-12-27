class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  # has_one :order
  has_one_attached :image
  with_options presence: true do
    validates :name 
    validates :text 
    validates :image 
    VALID_PRICEL_HALF = /\A[0-9]+\z/
    validates  :price, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
      greater_than: 299, less_than: 10000000
      }
  
    validates :category_id,numericality: { other_than: 1 }
    validates :status_id,numericality: { other_than: 1 }
    validates :shipping_fee_id,numericality: { other_than: 1 }
    validates :prefecture_id,numericality: { other_than: 1 }
    validates :scheduled_delivery_id,numericality: { other_than: 1 }
  end


end
