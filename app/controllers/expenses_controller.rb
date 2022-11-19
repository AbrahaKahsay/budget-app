class ExpensesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @expenses = Expense.joins(:category_expenses).where(category_expenses:{category_id: params[:category_id]}).where(user_id: current_user.id).order(created_at: :desc)
    @total = Expense.joins(:category_expenses).where(category_expenses:{category_id: params[:category_id]}).where(user_id: current_user.id).sum(:amount)

  end

  
  def new
  end

  private 
  def expense_params 
    params.require(:expense).permit(:name, :amount)
  end
end
