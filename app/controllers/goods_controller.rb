class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy, :add_to_cart]
  before_filter :initialize_cart



  def index
    @goods = Good.all
  end


  def new
    @good = Good.new
  end


  def edit
  end


  def update
      if @good.update(good_params)
        flash[:notice] = 'Good was successfully updated.'
        redirect_to goods_path
      else
        render :action => 'edit'
      end
  end


  def show
  end


  def create
    @good = Good.new(good_params)
      if @good.save
        flash[:notice] = 'Good was successfully created.'
        redirect_to goods_path
      else
        render :action => 'new'
      end
  end


  def destroy
    @good.destroy
    redirect_to goods_path
  end


private


  def set_good
    @good = Good.find(params[:id])
  end


  def good_params
    params.require(:good).permit(:name, :price, :category_id)
  end


end
