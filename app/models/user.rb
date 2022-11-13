class User < ApplicationRecord
    validates :name, presence: true

    has_many :categories, dependent: :destroy
    has_many :expenses, dependent: :destroy
end
