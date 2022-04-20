require 'rails_helper'

RSpec.describe MenuItemOrder, type: :model do
  it 'respond to menu_item_id & order_id' do
    menu_order = FactoryBot.build(:menu_item_order, menu_item_id: 1, order_id: 1)
    expect(menu_order).to respond_to :menu_item_id
    expect(menu_order).to respond_to :order_id
  end
end
