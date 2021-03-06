require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:cat1){FactoryBot.build(:category)}
  let(:cat2){FactoryBot.build(:category)}
  
  it 'has valid factory' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'has price greater than 0.01' do
    food1 = FactoryBot.build(:menu, price: 0.0001)
    food2 = FactoryBot.build(:menu, price: 1000.0)
    
    food1.valid?
    food2.valid?
    
    expect(food1.errors[:price]).to include('must be greater than or equal to 0.01')
    expect(food2).to be_valid
  end

  it 'is invalid with  duplicate name' do
    food1 = FactoryBot.create(:menu, name:'Nasi Kucing')
    food2 = FactoryBot.build(:menu, name:'Nasi Kucing')
    
    food2.valid?

    expect(food2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid if description has more than 150 characters' do
    food = FactoryBot.build(:menu, description: '!'*151)
    food.valid?
    expect(food.errors[:description]).to include('is too long (maximum is 150 characters)')
  end

  it 'has more than one cateogry' do
    food = FactoryBot.build(:menu)
    food.categories << [cat1, cat2]
    expect(food.categories).to match_array([cat1, cat2])
  end
end
