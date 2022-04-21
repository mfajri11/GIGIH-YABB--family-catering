class Order < ApplicationRecord
  belongs_to :customers
  has_many :menu_orders
  has_many :menus, through: :menu_orders
end
