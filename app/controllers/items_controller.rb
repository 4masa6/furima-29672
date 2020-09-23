class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show, :new]

  def index
    # indexに商品を表示する記述 @ item = Item.all でビューにわたす
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item) .permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :user_id, :image).merge(user_id: current_user.id)
  end
end