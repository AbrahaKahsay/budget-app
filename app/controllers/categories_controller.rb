class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
    @total = {}
    @categories.each do |category|
      @total[category.id] = Expense.joins(:category_expenses)
      .where(category_expenses:{category_id: category.id})
      .where(user_id: current_user.id).sum(:amount)
    end
  end

  def new; end
end
