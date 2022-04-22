class MenusController < ApplicationController
  # before_action :set_menu, only: %i[ show edit update destroy ]
  def index
    @menus = Menu.all
  end
  
  def new
    @menu = Menu.new
    @categories = Category.all
  end

  def create
    menu_params = get_menu_params
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html {redirect_to menu_path(@menu.id), notice: 'Menu was successfuly created'}
        format.json {render :show, status: :created, location: @menu}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @menu = Menu.find_by_id(params[:id])
    respond_to do |format|
      format.html {render :show, status: :ok}
      format.json {render @menu, status: :ok, location: @menu }
    end
  end

  def edit
    @menu = Menu.find_by_id(params[:id])
    render :edit
  end

  def update
    menu_params = get_menu_params
    @menu = Menu.find_by_id(params[:id])

    respond_to do |format|
      if @menu.update(menu_params)
        format.html {redirect_to @menu, status: :see_other, notice: 'Menu was successfuly udpated'}
        format.json {render :update, status: :no_content}
      else
        format.html{render :edit, status: :unprocessable_entity}
        format.json {render @menu.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @menu = Menu.find_by_id(params[:id])
    respond_to do |format|
      if @menu.destroy
        format.html {redirect_to menus_path, notice: 'Menu was successfuly deleted'}
        format.json {render :delete, status: :no_content}
      else
        format.json {render @menu.errors, status: :unprocessable_entity}
      end
    end
    
    
  end

  private
  
  def get_menu_params
    params.require(:menu)
    .permit(
      :name, 
      :description, 
      :price,
    category_ids:[])
  end
  
end
