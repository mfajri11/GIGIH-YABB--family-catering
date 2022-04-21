require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer){FactoryBot.create(:customer)}
  let(:order1){FactoryBot.create(:order, customer_id: customer.id)}
  let(:order2){FactoryBot.create(:order, customer_id: customer.id)}
  let(:uduk){FactoryBot.create(:menu, name:'Nasi Uduk')}
  let(:kerak_telor){FactoryBot.create(:menu, name:'Kerak Telor')}
  let(:invalid_customer){FactoryBot.build(:invalid_customer, email:'hahaa@gigih')}
  
  it 'is invalid with invalid email' do
    expect(invalid_customer).not_to be_valid
  end

  it 'is valid with valid email' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is valid customer has more than one order' do
    order1.menus << [uduk, kerak_telor]
    order2.menus << [uduk]
    customer.orders << [order1, order2]
    expect(customer.orders).to match_array([order1, order2])    
  end
  
end
