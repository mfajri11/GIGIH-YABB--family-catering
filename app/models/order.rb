class Order < ApplicationRecord
  belongs_to :customers
  has_many :menu_item_orders
  has_many :menu_items, through: :menu_item_orders
end
