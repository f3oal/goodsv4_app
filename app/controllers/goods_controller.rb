class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :destroy]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
  end


 

  # GET /goods/new
 def new
   @good = Good.new
 end
 def show
   
 end
 
 

  # POST /goods
  # POST /goods.json
  def create
    
    @good = Good.new(good_params)
    
    if @good.save
      redirect_to table_path
    else
      render :action => 'new'
    end
 end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
  @good = Good.find(params[:id])
    @good.destroy

    redirect_to table_path
 end

  private
    
     def set_good
      @good = Good.find(params[:id])
    end
    
    def good_params
      params.require(:good).permit(:name, :price, :category_id)
    end

end