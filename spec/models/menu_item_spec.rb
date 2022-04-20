require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it 'has valid factory' do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'has price greater than 0.01' do
    food1 = FactoryBot.build(:menu_item, price: 0.0001)
    food2 = FactoryBot.build(:menu_item, price: 1000.0)
    
    food1.valid?
    food2.valid?
    
    expect(food1.errors[:price]).to include('must be greater than or equal to 0.01')
    expect(food2).to be_valid
  end

  it 'is invalid with  duplicate name' do
    food1 = FactoryBot.create(:menu_item, name:'Nasi Kucing')
    food2 = FactoryBot.build(:menu_item, name:'Nasi Kucing')
    
    food2.valid?

    expect(food2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid if description has more than 150 characters' do
    food = FactoryBot.build(:menu_item, description: '!'*151)
    food.valid?
    expect(food.errors[:description]).to include('is too long (maximum is 150 characters)')
  end
end
