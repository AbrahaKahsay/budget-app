class ExpensesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @expenses = Expense.joins(:category_expenses).where(category_expenses: { category_id: params[:category_id] }).where(user_id: current_user.id).order(created_at: :desc)
    @total = Expense.joins(:category_expenses).where(category_expenses: { category_id: params[:category_id] }).where(user_id: current_user.id).sum(:amount)
  end

  def new; end

  def create
    @expense = Expense.new(name: params[:name], amount: params[:amount], user_id: current_user.id)

    if @expense.save!
      params[:category_ids].each do |category_id|
        CategoryExpense.create(category_id:, expense_id: @expense.id) if category_id != ''
      end
      redirect_to category_expenses_path
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_ids)
  end
end
