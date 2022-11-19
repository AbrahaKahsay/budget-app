class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id).order(created_at: :desc)
    @total = {}
    @categories.each do |category|
      @total[category.id] = Expense.joins(:category_expenses)
        .where(category_expenses: { category_id: category.id })
        .where(user_id: current_user.id).sum(:amount)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
