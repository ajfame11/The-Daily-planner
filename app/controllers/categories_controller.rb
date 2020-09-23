class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def show
      @category = Category.find params[:id]
    end
  
    def create
      @category = Category.create(category_params)
      if @category.valid?
        redirect_to categories_path
      else
        render 'new'
      end

    end
  
    def edit
      @category = Category.find params[:id]
    end
  
    def update
      @category = Category.find params[:id]
      @category.update(category_params)
      redirect_to categories_path
    end

    def destroy
         @category = Category.find params[:id]
         @category.destroy
         redirect_to categories_path
    end

  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end