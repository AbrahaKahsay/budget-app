class ExpensesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def new
  end
end
