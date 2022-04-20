class MenuItemCategory < ApplicationRecord
  belongs_to :menuItem
  belongs_to :category
end
