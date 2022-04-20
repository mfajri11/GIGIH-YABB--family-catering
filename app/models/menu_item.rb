class MenuItem < ApplicationRecord
  has_many :menu_item_orders
  has_many :orders, through: :menu_item_orders
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {only_float: true, greater_than: 0.01}
  validates :description, length: {maximum: 150}
end
