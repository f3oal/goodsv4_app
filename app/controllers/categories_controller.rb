class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end
	
    def show
      @category = Category.find(params[:id])
    end

    def new
      @category= Category.new
    end

    def create
      @category = Category.new(category_params)
        
        if @category.save
          redirect_to categories_path
        else
          render :action => 'new'
        end
    end

    def destroy
      @category = Category.find(params[:id])

        unless @category.destroy 
          flash[:error] = @сategory.errors.full_messages
        end
        
      redirect_to categories_path
    end

private

    def category_params
      params.require(:category).permit(:name)
    end
end
