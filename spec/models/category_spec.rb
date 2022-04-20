require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has valid name' do
    expect(FactoryBot.build(:category)).to be_valid
  end
end
