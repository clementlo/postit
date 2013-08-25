class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You have created a new category"
      redirect_to root_path
    else
      render :new
    end
  end


private

  def category_params
    params.require(:category).permit(:name)
  end

end

