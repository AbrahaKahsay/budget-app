class AddCategoryIdToCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :category_expenses, :category_id, :int
  end
end
