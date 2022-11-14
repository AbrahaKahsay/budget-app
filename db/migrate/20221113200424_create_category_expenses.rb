class CreateCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenses do |t|
      t.bigint :expense_id
      t.bigint :category_id
      
      t.timestamps
    end
  end
end
