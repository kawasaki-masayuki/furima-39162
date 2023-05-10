class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validates :product_name,           presence: true
  validates :category_id,            presence: true, numericality: { other_than: 1 }
  validates :commodity_condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_charge_id,     presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,          presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id,       presence: true, numericality: { other_than: 1 }
  validates :explanation,            presence: true
  validates :price,                  presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image,                  presence: true
  validate  :validate_image_format

  private

  def validate_image_format
    return unless image.attached?

    unless image.blob.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, "should be a JPEG or PNG file")
    end
  end
end