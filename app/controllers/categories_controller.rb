class CategoriesController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  def index
    @categories = Category.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_path(params[user_id: current_user.id])
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

# This stuff is not complete