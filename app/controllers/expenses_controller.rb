class ExpensesController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.all
    @total = 0
    @expenses.each do |expense|
      @total += expense.amount
    end
  end

  def new
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.new(expense_params)
    @expense.user_id = current_user.id

    if @expense.save
      flash[:notice] = 'Transaction was successfully created'
      redirect_to category_expenses_path(@category)
    else
      render :new
    end
  end

  def recent_expenses
    @expenses = @category.expenses.all
    @expenses.order(created_at: :desc)
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id, :category)
  end
end
