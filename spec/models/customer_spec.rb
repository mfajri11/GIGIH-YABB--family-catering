require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is invalid with invalid email' do
    invalid_customer = FactoryBot.build(:invalid_customer, email:'hahaa@gigih')
    expect(invalid_customer).not_to be_valid
  end

  it 'is valid with valid email' do
    expect(FactoryBot.build(:customer)).to be_valid
  end
  
end
