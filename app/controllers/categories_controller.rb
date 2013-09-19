class CategoriesController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def edit 
  end

  def show
  end

  def new
    @category= Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to categories_path
    else
      render :action => 'new'
    end
  end

  def update

    if @category.update(category_params)
      flash[:notice] = 'Category was successfully updated.'
      redirect_to @category
    else
      render :action => 'edit'
    end
  end

  def destroy


    unless @category.destroy
      flash[:error] = @category.errors.full_messages
    end

    redirect_to categories_path
  end

  private

  def set_good
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
