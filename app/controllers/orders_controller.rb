class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[ :index]

  def index
    @item = Item.find(params[:item_id])
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
  end
  
  private

end