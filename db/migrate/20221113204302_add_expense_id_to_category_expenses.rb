class AddExpenseIdToCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :category_expenses, :expense_id, :int
    add_column :category_expenses, :category_id, :int
  end
end
