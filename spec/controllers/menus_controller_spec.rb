require 'rails_helper'

RSpec.describe MenusController do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'save the new menu in the database' do
        expect {
          post :create, params: {menu_item: attributes_for(:menu_item)}
        }.to change(MenuItem, :count).by(1)
      end

      it 'redirect to show' do
        post :create, params: {menu_item: attributes_for(:menu_item)}
        expect(response).to redirect_to(menu_path(assigns[:menu]))
      end
    end
    
    context 'with invalid attributes' do
      it 'does not save the new food to the database' do
        expect{
          post :create, params: {menu_item: attributes_for(:invalid_menu_item)}
        }.not_to change(MenuItem, :count)
      end

      it 're-renders the new template' do
        post :create, params: {menu_item: attributes_for(:invalid_menu_item)}
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'the requested menu to @menu' do
      menu = create(:menu_item)
      get :edit, params: {id: menu}
      expect(assigns(:menu)).to eq menu
    end

    it 'render the edit template' do
      menu = create(:menu_item)
      get :edit, params: {id: menu}
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before :each do
      @menu = create(:menu_item)
    end

    context 'with valid attributes' do
      it 'locates the requested @menu' do
        patch :update, params: {id: @menu, menu_item: attributes_for(:menu_item)}
        expect(assigns(:menu)).to eq @menu
      end
      it 'changes @menu\' attributes' do
        patch :update, params: {id: @menu, menu_item: attributes_for(:menu_item, name:'Nasi Pecel')}
        @menu.reload
        expect(@menu.name).to eq('Nasi Pecel')
      end

      it 'redirect to the menus#show' do
        patch :update, params: {id: @menu, menu_item: attributes_for(:menu_item)}
        expect(response).to redirect_to :menus
      end
    end
  end
  
  describe 'GET #index' do
    it 'show all menus available' do
      nasi_uduk = create(:menu_item, name: 'Nasi Uduk')
      nasi_kucing = create(:menu_item, name: 'Nasi Kucing')
      soto_ayam = create(:menu_item, name: 'Soto Ayam')

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
      @menu = create(:menu_item)
    end
    it 'deletes the menu from the database' do
      expect {
        delete :destroy, params: {id: @menu}
      }.to change(MenuItem, :count).by(-1)
    end
    
    it 'redirect to menu#index' do
      delete :destroy, params: {id: @menu}
      expect(response).to redirect_to menus_url
    end
  end
  
end