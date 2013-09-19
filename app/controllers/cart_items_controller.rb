class CartItemsController < ApplicationController
  before_filter :initialize_cart


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to @cart
  end


end
