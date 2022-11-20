class CreateCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenses do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :expense, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
