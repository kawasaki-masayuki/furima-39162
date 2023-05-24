class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :commodity_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery_date
  has_one    :purchase
  has_one_attached :image
  has_many :comments

  validates :product_name,           presence: true
  validates :category_id,            presence: true, numericality: { other_than: 1 }
  validates :commodity_condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_charge_id,     presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,          presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id,       presence: true, numericality: { other_than: 1 }
  validates :explanation,            presence: true
  validates :price,                  presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :image, presence: true
  
end