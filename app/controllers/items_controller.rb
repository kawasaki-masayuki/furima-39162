class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
    #↓購入機能時に実装する↓
    #if @item.purchased?
      #@sold_out = true
    #elsif @user_signed_in && @item.user == @current_user
      #@is_owner = true
    #else
      #@is_owner = false
    #end
    #↑購入機能時に実装する↑
  end

  #↓編集機能時に実装する↓
  #def edit
    #@item = Item.find(params[:id])
  #end

  #def update
    #item = Item.find(params[:id])
    #item.update(item_params)
  #end
  #↑編集機能時に実装する↑

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :commodity_condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  #def contributor_confirmation
    #redirect_to root_path unless current_user == @item.user
  #end

end
