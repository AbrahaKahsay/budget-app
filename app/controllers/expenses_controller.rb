class ExpensesController < ApplicationController
    before_action :authenticate_user!
    # load_and_authorize_resource
    def index;
        @expenses = Expense.all
    end

    # def show
    #     @expense = Expense.find(params[:id])
    #   end

    def new
        @expense = Expense.new
    end

    def create
        @expense = Expense.new(expense_params)
        @expense.user_id = current_user.id

        if @expense.save
            redirect_to category_expenses_path(@category)
        else
            render 'new'
        end
    end

    private
    
    def expense_params
      params.require(:expense).permit(:name, :amount)
    end
    
  end