class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[ :index]

  def index
    @item = Item.find(params[:item_id])
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render "index"
    end
  end
  
  private

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end