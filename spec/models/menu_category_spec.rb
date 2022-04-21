require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  
  it'respond to menu_id & category_id attributes'do
    menu_cat = FactoryBot.build(:menu_category, menu_id: 1, category_id: 1)
    expect(menu_cat).to respond_to :menu
    expect(menu_cat).to respond_to :category
  end
end
