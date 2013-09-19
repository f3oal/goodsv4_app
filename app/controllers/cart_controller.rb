class CartController < ApplicationController

  before_filter :initialize_cart



  def show
  end

  def add_to_cart
    @good = Good.find(params[:id])
    @cart_item = CartItem.find_by(good_id: @good.id)
    if @cart_item
      flash[:error] = 'You have this one in your cart'
      redirect_to goods_path
    else
      @cart.goods << @good
      redirect_to @cart
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

end
