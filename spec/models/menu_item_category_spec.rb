require 'rails_helper'

RSpec.describe MenuItemCategory, type: :model do
  
  it'respond to menu_item_id & category_id attributes'do
    menu_cat = FactoryBot.build(:menu_item_category, menu_item_id: 1, category_id: 1)
    expect(menu_cat).to respond_to :menu_item
    expect(menu_cat).to respond_to :category
  end
end
