class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    Item.create
    if @item.save
      redirect_to root_path
    else
      @item = Item.new(item_params)
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :commodity_condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end
