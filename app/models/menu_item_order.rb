class MenuItemOrder < ApplicationRecord
  belongs_to :menuItem
  belongs_to :order
end
