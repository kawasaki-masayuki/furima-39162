class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.all ← 商品一覧表示機能で実装
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :commodity_condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  #↓先の実装で使用↓
  #def contributor_confirmation
    #redirect_to root_path unless current_user == @item.user
  #end

end
