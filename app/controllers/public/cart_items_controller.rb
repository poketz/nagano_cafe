class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def create
    @cart_items = CartItem.all
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save!
      redirect_to cart_items_path
    else
      render :index
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
