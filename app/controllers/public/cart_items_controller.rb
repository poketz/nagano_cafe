class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item =
    @total_price = 0
  end

  def create
    @cart_items = current_customer.cart_items.all
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_items.present?
      @cart_items.each do |cart_item|
        if @cart_items.find_by(item_id: cart_item_params[:item_id])
          cart_item.amount += cart_item_params[:amount].to_i
          cart_item.update!(amount: cart_item.amount)
        else
          @cart_item.save!
        end
      end
    else  
      @cart_item.save!
    end
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
