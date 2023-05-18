class PurchasesController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :create]
  
  def index
    @purchase_delivery = PurchaseDelivery.new(user_id: current_user.id)
    @item = Item.find(params[:item_id])
    #@purchased = @item.purchases.exists?
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)#.merge(delivery_params))
    @item = Item.find(params[:item_id])
    #@purchased = @item.purchases.exists?
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
    #if @purchase.valid?
      #pay_item
      #@purchase.save
      #return redirect_to root_path
    #else
      #render 'index'
    #end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :commodity_condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :city, :address, :building_name, :telephone_number). merge(user_id: current_user.id, item_id: params[:item_id]) #, token: params[:token])
  end

  #def pay_item
    #Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    #Payjp::Charge.create(
      #amount: purchase_params[:price],  # 商品の値段
      #card: purchase_params[:token],    # カードトークン
      #currency: 'jpy'                 # 通貨の種類（日本円）
    #)
  #end

end