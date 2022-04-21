require 'rails_helper'

RSpec.describe MenuOrder, type: :model do
  it 'respond to menu_id & order_id' do
    menu_order = FactoryBot.build(:menu_order, menu_id: 1, order_id: 1)
    expect(menu_order).to respond_to :menu_id
    expect(menu_order).to respond_to :order_id
  end
end
