class Expense < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses
  belongs_to :user
end
