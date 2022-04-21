class MenusController < ApplicationController
  # before_action :set_menu, only: %i[ show edit update destroy ]
  def index
    @menus = Menu.all
  end
  
  def new
  end

  def create
    menu_params = get_menu_params
    @menu = Menu.create(menu_params)
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
      format.json {render @menu, status: :created, location: @menu }
    end
  end

  def edit
    @menu = Menu.find_by_id(params[:id])
    render :edit
  end

  def update
    # puts params
    menu_params = get_menu_params
    @menu = Menu.find_by_id(params[:id])

    if @menu.update(menu_params)
      redirect_to :menus
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu = Menu.find_by_id(params[:id])
    @menu.destroy
    redirect_to menus_path
  end

  private
  
  def get_menu_params
    params.require(:menu).permit(:name, :description, :price)
  end
  
end
