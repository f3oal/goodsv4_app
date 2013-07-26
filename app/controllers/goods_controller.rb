class GoodsController < ApplicationController
  

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
  end


 

  # GET /goods/new
 def new
   @good = Good.new
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
    
    
    
    def good_params
      params.require(:good).permit(:name, :price)
    end

end