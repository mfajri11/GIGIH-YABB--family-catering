class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category_params = get_category_params
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_path, status: :success}
      else
        format.json {render @category.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    respond_to do |format|
      if @category.destroy
        format.html {redirect_to categories_path, notice: 'category was successfuly deleted'}
        format.json {render :delete, status: :no_content}
      else
        format.json {render @category.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def update
    category_params = get_category_params
    @category = Category.find_by_id(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html {redirect_to category_path(@category), notice: "category was successfuly updated"}
      else
        format.json {render @category.errors, status: :unprocessable_entity}
      end
    end
  end
  private
  def get_category_params
    params.require(:category).permit(:name)
  end
end
