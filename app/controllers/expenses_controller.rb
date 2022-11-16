class ExpensesController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  def index
    @catagory = Category.find(params[:category_id])
    @expenses = @catagory.expenses.order(created_at: :desc)
  end

  # def show
  #     @expense = Expense.find(params[:id])
  # end

  def new
    @expense = Expense.new
    @categories = current_user.categories.order(created_at: :desc)
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id

    if @expense.save
      redirect_to category_expenses_path
    else
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
