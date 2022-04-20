class Category < ApplicationRecord
  has_many :menu_item_categories
  has_many :menuItems, through: :menu_item_categories

  scope :names, ->{pluck(:name)}
end
