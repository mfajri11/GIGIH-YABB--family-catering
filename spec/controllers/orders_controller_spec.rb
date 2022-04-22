require 'rails_helper'

RSpec.describe OrdersController do
  let(:customer){FactoryBot.create(:customer)}

  # describe 'GET #create' do
  #   context 'with valid attributes' do
  #     it 'save the new order in the database' do
  #       expect {
  #         post :create, params: {customer_id: customer.id, order: attributes_for(:order)}
  #       }.to change(Order, :count).by(1)
  #     end
  #   end
  # end
  
end