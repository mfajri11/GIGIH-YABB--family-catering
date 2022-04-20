class MenuItem < ApplicationRecord
  has_many :menu_item_orders
  has_many :orders, through: :menu_item_orders
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
end
