class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。 ハイフン(-)を含めてください"}
    validates :prefecture_id,    numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は無効です" }
    validates :token
  end

  def save
    # 購入者情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 配送先住所を保存する
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end