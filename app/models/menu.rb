class Menu < ApplicationRecord
  has_many :menu_orders
  has_many :orders, through: :menu_orders
  has_many :menu_categories
  has_many :categories, through: :menu_categories

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {only_float: true, greater_than_or_equal_to: 0.01}
  validates :description, length: {maximum: 150}

  enum status: {
    NEW: 0,
    PAID: 1,
    CANCELLED: 2
  }
end
