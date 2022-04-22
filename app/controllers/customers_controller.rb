class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer_params = get_customer_params
    @customer = Customer.new(customer_params)
    
    respond_to do |format|
      if @customer.save
        session[:current_user_id] = @customer.id
        format.html {redirect_to new_menu_path, notice: "Cusotmer was successfuly created"}
      else
        format.html {render :new}
        format.json {render @customer.errors, status: :unprocessable_entity}
      end
    end
  end

  def get_customer_params
    params.require(:customer)
    .permit(:name, :email, :phoneNumber)
  end
  
end
