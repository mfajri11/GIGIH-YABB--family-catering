require 'rails_helper'

RSpec.describe OrdersController do
  let(:customer){FactoryBot.create(:customer)}

  describe 'GET #create' do
    context 'with valid attributes' do
      it 'save the new order in the database' do
        expect {
          post :create, params: {order: attributes_for(:order, customer_id: customer.id)}
        }.to change(Order, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new food to the database' do
        expect{
          post :create, params: {order: attributes_for(:customer, customer_id:nil)}
        }.not_to change(Order, :count)
      end

      it 're-renders the new template' do
        post :create, params: {order: attributes_for(:customer, customer_id:nil)}
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @order = create(:order, customer_id: customer.id)
    end

    context 'with valid attributes' do
      it 'locates the requested @order' do
        patch :update, params: {id: @order, order: attributes_for(:order, customer_id:customer.id)}
        expect(assigns(:order)).to eq @order
      end
      it 'changes @order\' attributes' do
        patch :update, params: {id: @order, order: attributes_for(:order, customer_id: customer.id, total:1000.0)}
        @order.reload
        expect(@order.total).to eq(1000.0)
      end

      it 'redirect to the menus#show' do
        patch :update, params: {id: @order, order: attributes_for(:order, customer_id: customer.id,)}
        expect(response).to redirect_to @order
      end
    end

    context 'with invalid attributes' do
      it 'does not update @menu' do
        patch :update, params: {id: @order, order: attributes_for(:order, total:'hahaha')}
        expect(@order.total).not_to eq('hahaha')
      end

      it 're-render to the edit template' do
        patch :update, params: {id: @order, order: attributes_for(:order, total:'hahaha')}
          expect(assigns(:order)).to eq @order
          expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  
end