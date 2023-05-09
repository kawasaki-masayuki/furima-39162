class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validates :product_name, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :commodity_condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }
  validates :explanation,  presence: true
  validates :price,        presence: true
end