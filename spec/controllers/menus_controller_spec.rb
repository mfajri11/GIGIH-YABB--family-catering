require 'rails_helper'

RSpec.describe MenusController do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'save the new menu in the database' do
        expect {
          post :create, params: {menu: attributes_for(:menu)}
        }.to change(Menu, :count).by(1)
      end

      it 'redirect to show' do
        post :create, params: {menu: attributes_for(:menu)}
        expect(response).to redirect_to(menu_path(assigns[:menu]))
      end
    end
    
    context 'with invalid attributes' do
      it 'does not save the new food to the database' do
        expect{
          post :create, params: {menu: attributes_for(:invalid_menu)}
        }.not_to change(Menu, :count)
      end

      it 're-renders the new template' do
        post :create, params: {menu: attributes_for(:invalid_menu)}
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'the requested menu to @menu' do
      menu = create(:menu)
      get :edit, params: {id: menu}
      expect(assigns(:menu)).to eq menu
    end

    it 'render the edit template' do
      menu = create(:menu)
      get :edit, params: {id: menu}
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before :each do
      @menu = create(:menu)
    end

    context 'with valid attributes' do
      it 'locates the requested @menu' do
        patch :update, params: {id: @menu, menu: attributes_for(:menu)}
        expect(assigns(:menu)).to eq @menu
      end
      it 'changes @menu\' attributes' do
        patch :update, params: {id: @menu, menu: attributes_for(:menu, name:'Nasi Pecel')}
        @menu.reload
        expect(@menu.name).to eq('Nasi Pecel')
      end

      it 'redirect to the menus#show' do
        patch :update, params: {id: @menu, menu: attributes_for(:menu)}
        expect(response).to redirect_to @menu
      end
    end

    context 'with invalid attributes' do
      it 'does not update @menu' do
        patch :update, params: {id: @menu, menu: attributes_for(:invalid_menu, price:'hahaha')}
        expect(@menu.price).not_to eq('hahaha')
      end

      it 're-render to the edit template' do
        patch :update, params: {id: @menu, menu: attributes_for(:invalid_menu)}
          expect(assigns(:menu)).to eq @menu
          expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    
  end
  
  describe 'GET #index' do
    it 'show all menus available' do
      nasi_uduk = create(:menu, name: 'Nasi Uduk')
      nasi_kucing = create(:menu, name: 'Nasi Kucing')
      soto_ayam = create(:menu, name: 'Soto Ayam')

      get :index
      expect(assigns(:menus)).to match_array([nasi_uduk, nasi_kucing, soto_ayam])
    end

    it 'render the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @menu = create(:menu)
    end
    it 'deletes the menu from the database' do
      expect {
        delete :destroy, params: {id: @menu}
      }.to change(Menu, :count).by(-1)
    end
    
    it 'redirect to menu#index' do
      delete :destroy, params: {id: @menu}
      expect(response).to redirect_to menus_path
    end
  end
  
end