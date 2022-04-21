require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) {FactoryBot.create(:customer, id:1)}
  let(:uduk){FactoryBot.create(:menu, name:'Nasi Uduk', price: 10000.0)}
  let(:kerak_telor){FactoryBot.create(:menu, name:'Kerak Telor')}
  
  it 'add customer\'s orders' do
    expect(FactoryBot.build(:order, customer_id: customer.id)).to be_valid
  end

  it 'is has valid price' do
    order = FactoryBot.build(:order, customer_id: customer.id, total:'sfdjklfs')
    order.valid?
    expect(order.errors[:total]).to include("is not a number")
  end

  it 'is valid many order has more than one menu' do
    order = FactoryBot.build(:order, customer_id: customer.id, total:0)
    order.menus << [uduk, kerak_telor]
    expect(order.menus.size).to be > 1
  end

  it 'is valid order total price doesn\'t affected by menu\'s change' do
    order = FactoryBot.create(:order, customer_id: customer.id, total:0.0)
    order.menus << [uduk]
    uduk.write_attribute(:price, 43534.0)
    order.calculate_total!
    expect(order.total).to eq(10000.0)
    expect(order.total).not_to eq(43534.0)
  end

  it 'has initial status  (NEW) after created' do
    order = FactoryBot.create(:order, customer_id: customer.id)
    expect(order.status).to eq("NEW")
  end

end
