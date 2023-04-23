class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @items = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_burden_id, :sender_area_id,:shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
